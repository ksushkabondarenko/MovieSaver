

import UIKit

protocol TransferMovieBetweenVCDelegate: AnyObject {
    func transferMovieInfo(_ movieInfo: MovieInfo)
}

final class ViewController: UIViewController {
    
    // MARK: - Outlets
    // MARK: - Actions
    // MARK: - Properties
    
    // MARK: Public
    @IBOutlet var mainTableView: UITableView!
    
    // MARK: Private
    private var moviesInfo: [MovieInfo] = []
    
    // MARK: - API
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubViews(mainTableView)
        addSetUps()
        mainTableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainTableView.reloadData()
    }
    
    // MARK: - Setups
    
    private func addSetUps() {
        // navigationController
        title = "My Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        // mainTableView
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorStyle = .none
        mainTableView.backgroundColor = AppColor.backgroundColor
    }
    
    // MARK: - Helpers
    @IBAction func addFilmButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviesInfo.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        212
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mainTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            cell.movieImageView.image = moviesInfo[indexPath.row].imageMovie
            cell.nameMovieLabel.text = moviesInfo[indexPath.row].name
            cell.ratingMovieLabel.attributedText = ratingMovieInfo(indexPath)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailScreenVC = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            detailScreenVC.modalPresentationStyle = .formSheet
            detailScreenVC.movieInfo = moviesInfo[indexPath.item]
            navigationController?.pushViewController(detailScreenVC, animated: true)
        }
    }
    
    // MARK: - Helpers
    
    // MARK: Private
    private func ratingMovieInfo(_ indexPath: IndexPath) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)]
        let secondAttributes = [NSAttributedString.Key.foregroundColor:
                                    UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1),
                                NSAttributedString.Key.font:
                                    UIFont.systemFont(ofSize: 18, weight: .light)]
        let firstString = NSMutableAttributedString(string: "\(moviesInfo[indexPath.row].rating)", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "/10", attributes: secondAttributes)
        firstString.append(secondString)
        return firstString
    }
}

extension ViewController: TransferMovieBetweenVCDelegate {
    func transferMovieInfo(_ movieInfo: MovieInfo) {
        moviesInfo.append(movieInfo)
    }
}
