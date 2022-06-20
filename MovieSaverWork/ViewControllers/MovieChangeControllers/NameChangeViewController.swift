

import UIKit

final class NameChangeViewController: UIViewController, UITextFieldDelegate {
  
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
   
    // MARK: Private
    private let changeLabel = UILabel()
    private let nameTextField = UITextField()
    private let saveButton = UIButton()
    private let simpleView = UIView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setUpUI()
        nameTextField.delegate = self
    }
    
    // MARK: - Setups
    private func addSubviews() {
        view.addSubViews(changeLabel, nameTextField, saveButton, simpleView)
    }
    
    private func addConstraints() {
        //changeLabel
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        changeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        //nameTextField
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 192).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 25).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        //simpleView
        simpleView.translatesAutoresizingMaskIntoConstraints = false
        simpleView.bottomAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        simpleView.centerXAnchor.constraint(equalTo: nameTextField.centerXAnchor).isActive = true
        simpleView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        simpleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 25).isActive = true
        simpleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        //saveButton
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: simpleView.bottomAnchor, constant: 42).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }
    
    private func setUpUI() {
        // changeLabel
        changeLabel.text = "Film Name"
        changeLabel.font = .manrope(ofSize: 24, weight: .regular)
        changeLabel.textAlignment = .center
        // nameTextField
        nameTextField.placeholder = "Name"
        nameTextField.font = .manrope(ofSize: 17, weight: .regular)
        nameTextField.font = UIFont(name: "Manrope-Regular", size: 17)
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
        if nameTextField.text != "" {
            let name = nameTextField.text
            delegate?.transferMovieName(name ?? " ")
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Fill name movie!")
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

extension NameChangeViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ simpleTextField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
