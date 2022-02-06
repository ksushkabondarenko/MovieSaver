

import UIKit

final class LinkChangeViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
    
    // MARK: - API
    
    // MARK: Private
    private let changeLabel = UILabel()
    private let linkTextField = UITextField()
    private let saveButton = UIButton()
    private let simpleView = UIView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        addSetUps()
        linkTextField.delegate = self
    }
    
    // MARK: - Setups
    private func addSubviews() {
        view.addSubViews(changeLabel, linkTextField, saveButton, simpleView)
    }
    
    private func addConstraints() {
        changeLabel.pin.centerX(in: view).top(to: view, offset: 124).width(to: 200).height(to: 26)
        linkTextField.pin.centerX(in: view).top(to: view, offset: 192).height(to: 44).leading(to: view, offset: 25).trailing(to: view, offset: 25)
        simpleView.pin.centerX(in: linkTextField).bottom(to: linkTextField, offset: 0).height(to: 0.5).leading(to: view, offset: 25).trailing(to: view, offset: 25)
        saveButton.pin.centerX(in: view).top(to: simpleView, offset: 42).width(to: 79).height(to: 27)
    }
    
    private func addSetUps() {
        // changeLabel
        changeLabel.text = "Film YouTube Link"
        changeLabel.font = .manrope(ofSize: 24, weight: .regular)
        changeLabel.textAlignment = .center
        // nameTextField
        linkTextField.placeholder = "YouTube Link"
        linkTextField.font = .manrope(ofSize: 17, weight: .regular)
        linkTextField.font = UIFont(name: "Manrope-Regular", size: 17)
        // simpleView
        simpleView.backgroundColor = UIColor(red: 0.776, green: 0.776, blue: 0.784, alpha: 1)
        // saveButton
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = .manrope(ofSize: 18, weight: .regular)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonClick), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func saveButtonClick() {
        if let url = URL(string: linkTextField.text!) {
            delegate?.transferMovieYouTube(url)
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Add url movie!")
            linkTextField.text = ""
        }
    }
    
    // MARK: - Helpers
    private func showAllert(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension LinkChangeViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ simpleTextField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
