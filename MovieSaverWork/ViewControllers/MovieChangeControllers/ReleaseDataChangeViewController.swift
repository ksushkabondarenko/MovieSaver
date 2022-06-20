
import UIKit

final class ReleaseDataChangeViewController: UIViewController {
  
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
    
    // MARK: Private
    private let changeLabel = UILabel()
    private let saveButton = UIButton()
    private let datePicker = UIDatePicker()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setUpUI()
    }
    
    // MARK: - Setups
    private func addSubviews() {
        view.addSubViews(changeLabel, saveButton, datePicker)
    }
    
    private func addConstraints() {
        //changeLabel
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        changeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        //datePicker
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 182).isActive = true
        datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 194).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //saveButton
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 408).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    private func setUpUI() {
        // changeLabel
        changeLabel.text = "Release Date"
        changeLabel.font = .manrope(ofSize: 24, weight: .regular)
        changeLabel.textAlignment = .center
        // saveButton
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = .manrope(ofSize: 18, weight: .regular)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonClick), for: .touchUpInside)
        // datePicker
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID!)
    }
    
    // MARK: - Actions
    @objc private func saveButtonClick() {
        delegate?.transferMovieDate(datePicker.date)
        navigationController?.popViewController(animated: true)
    }
}
