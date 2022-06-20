

import UIKit

protocol TransferMovieBetweenVCDelegate: AnyObject {
    func transferMovieInfo(_ movieInfo: MovieInfo)
}

final class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet var mainTableView: UITableView!
    
    // MARK: Private
    private var moviesInfo: [MovieInfo] = []
    
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviesInfo.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        212
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mainTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            cell.set(movie: moviesInfo[indexPath.row])
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
}

extension ViewController: TransferMovieBetweenVCDelegate {
    func transferMovieInfo(_ movieInfo: MovieInfo) {
        moviesInfo.append(movieInfo)
    }
}
