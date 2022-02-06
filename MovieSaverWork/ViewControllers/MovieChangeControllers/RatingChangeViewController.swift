

import UIKit

final class RatingChangeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
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
    
    // MARK: - Outlets
    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
    
    // MARK: - API
    // MARK: - Helpers
    
    // MARK: Private
    private let changeLabel = UILabel()
    private let saveButton = UIButton()
    private let ratingPicker = UIPickerView()
    private var arrayPickerView: [Double] = []
    private var rating = ""
    private func array() -> [Double] {
        var array: [Double] = []
        var index: Double = 0
        for _ in 1 ... 101 {
            array.append(round(10 * index) / 10)
            index += 0.1
        }
        return array
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        addSetUps()
        arrayPickerView = array()
    }
    
    // MARK: - Setups
    private func addSubviews() {
        view.addSubViews(changeLabel, saveButton, ratingPicker)
    }
    
    private func addConstraints() {
        changeLabel.pin.centerX(in: view).top(to: view, offset: 124).width(to: 200).height(to: 26)
        ratingPicker.pin.centerX(in: view).top(to: view, offset: 182).height(to: 131).leading(to: view, offset: 0).trailing(to: view, offset: 0)
        saveButton.pin.centerX(in: view).top(to: view, offset: 345).width(to: 79).height(to: 27)
    }
    
    private func addSetUps() {
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
