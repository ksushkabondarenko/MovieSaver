import UIKit

final class SecondViewController: UIViewController {

   
    
    // MARK: - Properties
    // MARK: Public

    // MARK: - API
    // MARK: - Setups
    // MARK: - Helpers

    
    // MARK: Public
    
   // public var movieInfo: MovieInfo = MovieInfo()
    
    
    // MARK: Private
    
   // private var imageButton = UIButton()
    //private let saveImage: UIImage = UIImage(named: "pictureImage")!
    //private let imageView = UIImageView()
    
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        addConstraints()
        setUps()
        //imageView.image = saveImage
        
        
        //navigationController
        self.title = "Add new"
        navigationController?.navigationBar.prefersLargeTitles = true
        var saveButton = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: "Save")
        navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.hidesBackButton = true
        
        
        
       

    }
    
    
    // MARK: - Setups
    
    private func addSubViews() {
       // view.addSubview(imageButton)
        //view.addSubview(imageView)
    }
    
    private func addConstraints() {
        
//        //imageButton
//
//        imageButton.translatesAutoresizingMaskIntoConstraints = false
//        imageButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        imageButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        imageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        imageButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 167).isActive = true
//
//        //imageView
//
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 167).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
    }
    
    private func setUps() {
        //imageButton
//
//        imageButton.layer.cornerRadius = 75
//        imageButton.layer.backgroundColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha: 1).cgColor
//        imageButton.addTarget(self, action: #selector(buttonOnClick), for: .touchUpInside)
//
//        //imageView
//
//        imageView.layer.cornerRadius = 75
    }
    
    
       @objc func buttonOnClick(_ sender: UIButton)
    {
       
        
    }
    
   
    // MARK: - Actions
    
    
//    @IBAction func changeNameButton(_ sender: UIButton) {
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "NameChangeViewController") as! NameChangeViewController
//        navigationController?.pushViewController(vc, animated: true)
//
//    }
    
    
    
    
    
    
}

