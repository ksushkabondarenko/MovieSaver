

import UIKit

final class ViewController: UIViewController {

    
    
    // MARK: - Outlets
    // MARK: - Actions
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    
    // MARK: - API


    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //navigationController
        self.title = "My Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    // MARK: - Setups
    
    private func addSubViews() {
        
    }
    
    // MARK: - Helpers
    
    @IBAction func addFilmButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    


}
