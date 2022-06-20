import UIKit

protocol TransferDataBetweenVCDelegate: AnyObject {
    func transferMovieName(_ name: String)
    func transferMovieRating(_ rating: String)
    func transferMovieDate(_ date: Date)
    func transferMovieYouTube(_ url: URL)
}

final class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    // MARK: Public
    public var movieInfo = MovieInfo()
    weak var delegate: TransferMovieBetweenVCDelegate?
    
    // MARK: Private
    private var selectedImage: UIImage?
    private var imagePicker = UIImagePickerController()
    
    // MARK: - Outlets
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var youTubeLinkLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupToHideKeyboardOnTapOnView()
    }
    
    // MARK: - Setups
    private func setUpUI() {
        // navigationController
        title = "Add new"
        navigationController?.navigationBar.prefersLargeTitles = true
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonClick))
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.hidesBackButton = true
        // view
        view.backgroundColor = AppColor.backgroundColorWithWhite
    }
    
    @objc func saveButtonClick(_ sender: UIBarButtonItem) {
        
        if nameLabel.text != "-" && releaseDateLabel.text != "-" && ratingLabel.text != "-" && youTubeLinkLabel.text != "-" && descriptionTextView.text != "" && selectedImage != nil {
            movieInfo.name = nameLabel.text!
            movieInfo.rating = ratingLabel.text!
            movieInfo.releaseDate = releaseDateLabel.text!
            movieInfo.youtubeLink = URL(string: youTubeLinkLabel.text!)!
            movieInfo.description = descriptionTextView.text!
            movieInfo.imageMovie = imageView.image!
            delegate?.transferMovieInfo(movieInfo)
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Fill in all fields")
        }
    }
    
    // MARK: - Actions
    @IBAction func imageButton(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    private func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.editedImage] as? UIImage {
            imageView.image = image
            selectedImage = image
        }
    }
    
    @IBAction func changeNameButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NameChangeViewController") as! NameChangeViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.delegate = self
    }
    
    @IBAction func changeRatingButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RatingChangeViewController") as! RatingChangeViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.delegate = self
    }
    
    @IBAction func changeReleaseDataButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ReleaseDataChangeViewController") as! ReleaseDataChangeViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func changeLinkButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LinkChangeViewController") as! LinkChangeViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.delegate = self
    }
    
    // MARK: - Helpers
    private func showAllert(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
}

extension SecondViewController: TransferDataBetweenVCDelegate {
    func transferMovieRating(_ rating: String) {
        ratingLabel.text = rating
    }
    
    func transferMovieDate(_ date: Date) {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy"
        releaseDateLabel.text = dateformatter.string(from: date)
    }
    
    func transferMovieYouTube(_ url: URL) {
        youTubeLinkLabel.text = url.absoluteString
    }
    
    func transferMovieName(_ name: String) {
        nameLabel.text = name
    }
}

extension SecondViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
