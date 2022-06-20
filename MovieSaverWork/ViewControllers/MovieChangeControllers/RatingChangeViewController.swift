import UIKit

final class RatingChangeViewController: UIViewController {
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
 
    // MARK: Private
    private let changeLabel = UILabel()
    private let saveButton = UIButton()
    private let ratingPicker = UIPickerView()
    private var arrayPickerView: [Double] = []
    private var rating = ""
    private func array() -> [Double] {
        var array: [Double] = []
        for x in stride(from: 0, to: 100, by: 1) {
            array.append((round(10 * (Double(x) * 0.1)) / 10))
        }
        return array
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setUpUI()
        arrayPickerView = array()
    }
    
    // MARK: - Setups
    private func addSubviews() {
        view.addSubViews(changeLabel, saveButton, ratingPicker)
    }
    
    private func addConstraints() {
        //changeLabel
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        changeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        //ratingPicker
        ratingPicker.translatesAutoresizingMaskIntoConstraints = false
        ratingPicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 182).isActive = true
        ratingPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ratingPicker.heightAnchor.constraint(equalToConstant: 131).isActive = true
        ratingPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        ratingPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //saveButton
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 345).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    private func setUpUI() {
        // changeLabel
        changeLabel.text = "Your Rating"
        changeLabel.font = .manrope(ofSize: 24, weight: .regular)
        changeLabel.textAlignment = .center
        // saveButton
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = .manrope(ofSize: 18, weight: .regular)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonClick), for: .touchUpInside)
        // ratingPicker
        ratingPicker.dataSource = self
        ratingPicker.delegate = self
    }
    
    // MARK: - Actions
    @objc private func saveButtonClick() {
        if rating != "" {
            delegate?.transferMovieRating(rating)
            navigationController?.popViewController(animated: true)
        } else {
            rating = "0.0"
            delegate?.transferMovieRating(rating)
            navigationController?.popViewController(animated: true)
        }
    }
}
    extension RatingChangeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            1
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            arrayPickerView.count
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            String(arrayPickerView[row])
        }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            rating = String(arrayPickerView[row])
        }
    }

