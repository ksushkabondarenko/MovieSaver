
import UIKit

final class TableViewCell: UITableViewCell {
    // MARK: Private
    private let mainView: UIView = UIView()
    private let infoMovieStackView: UIStackView = UIStackView()
    private let infoView: UIView = UIView()
    private var movieImageView: UIImageView = UIImageView()
    private var nameMovieLabel: UILabel = UILabel()
    private var ratingMovieLabel: UILabel = UILabel()
    
    //MARK: - LIfecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addAllSubviews()
        addConstraints()
        addSetupsUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    func set(movie: MovieInfo) {
        movieImageView.image = movie.imageMovie
        nameMovieLabel.text = movie.name
        ratingMovieLabel.attributedText = ratingMovieInfo(movie: movie)
    }
    
    // MARK: Private
    private func ratingMovieInfo(movie: MovieInfo) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)]
        let secondAttributes = [NSAttributedString.Key.foregroundColor:
                                    UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1),
                                NSAttributedString.Key.font:
                                    UIFont.systemFont(ofSize: 18, weight: .light)]
        let firstString = NSMutableAttributedString(string: "\(movie.rating)", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "/10", attributes: secondAttributes)
        firstString.append(secondString)
        return firstString
    }
    
    // MARK: Private
    private func addConstraints() {
        addMainViewConstraint()
        addImageViewConstraints()
        addInfoViewConstraints()
        addInfoMovieStackView()
    }
    private func addMainViewConstraint() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    private func addImageViewConstraints() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 197).isActive = true
    }
    private func addInfoViewConstraints() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        infoView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: -7).isActive = true
        infoView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -7).isActive = true
    }
    private func addInfoMovieStackView() {
        infoMovieStackView.translatesAutoresizingMaskIntoConstraints = false
        infoMovieStackView.topAnchor.constraint(equalTo: infoView.topAnchor).isActive = true
        infoMovieStackView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor).isActive = true
        infoMovieStackView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor).isActive = true
        infoMovieStackView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor).isActive = true
    }
    // MARK: Private
    private func addAllSubviews() {
        contentView.addSubViews(mainView,movieImageView, infoView)
        infoView.addSubview(infoMovieStackView)
        infoMovieStackView.addArrangedSubview(nameMovieLabel)
        infoMovieStackView.addArrangedSubview(ratingMovieLabel)
    }
    private func addSetupsUI() {
        addCellSetUp()
        addMainViewUI()
        addMovieImageViewUI()
        addInfoView()
        addInfoMovieStackViewUI()
        addNameMovieLabelUI()
        addRatingMovieLabelUI()
    }
    private func addCellSetUp() {
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.masksToBounds = true
        self.backgroundColor = AppColor.backgroundColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
    }
    private func addMovieImageViewUI() {
        movieImageView.layer.cornerRadius = 8
        movieImageView.clipsToBounds = true
    }
    private func addMainViewUI() {
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 8
    }
    
    private func addInfoView() {
        infoView.backgroundColor = .white
    }
    private func addInfoMovieStackViewUI() {
        infoMovieStackView.axis = .vertical
        infoMovieStackView.alignment = .center
        infoMovieStackView.distribution = .fillEqually
    }
    private func addNameMovieLabelUI() {
        nameMovieLabel.font = .manrope(ofSize: 18, weight: .regular)
        nameMovieLabel.textAlignment = .center
        nameMovieLabel.textColor = .black
        nameMovieLabel.numberOfLines = 3
    }
    private func addRatingMovieLabelUI() {
        ratingMovieLabel.font = .manrope(ofSize: 18, weight: .regular)
        ratingMovieLabel.text = "8.9/10"
        ratingMovieLabel.textAlignment = .center
        ratingMovieLabel.textColor = .black
    }
}
