import UIKit

extension ViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ simpleTextField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
