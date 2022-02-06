
import UIKit

final class ReleaseDataChangeViewController: UIViewController {
    
    // MARK: - Outlets
    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
    
    // MARK: - API
    // MARK: - Helpers
    // MARK: Private
    private let changeLabel = UILabel()
    private let saveButton = UIButton()
    private let datePicker = UIDatePicker()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        addSetUps()
    }
    
    // MARK: - Setups
    private func addSubviews() {
        view.addSubViews(changeLabel, saveButton, datePicker)
    }
    
    private func addConstraints() {
        changeLabel.pin.centerX(in: view).top(to: view, offset: 124).width(to: 200).height(to: 26)
        datePicker.pin.centerX(in: view).top(to: view, offset: 182).height(to: 194).leading(to: view, offset: 0).trailing(to: view, offset: 0)
        saveButton.pin.centerX(in: view).top(to: view, offset: 408).width(to: 79).height(to: 27)
    }
    
    private func addSetUps() {
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
