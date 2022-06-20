import UIKit
import WebKit

final class MovieDetailsViewController: UIViewController {
    
    // MARK: Public
    public var movieInfo = MovieInfo()
    
    // MARK: Private
    private let movieImage = UIImageView()
    private let scrollView = UIScrollView()
    private let infoView = UIView()
    private let nameLabel = UILabel()
    private let ratingLabel = UILabel()
    private let descriptionTextView = UITextView()
    private let trailerWebView = WKWebView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setUpUI()
        addInfoMovie()
    }
    
    // MARK: - Setups
    private func addSubviews() {
        view.addSubViews(movieImage, scrollView)
        scrollView.addSubViews(infoView)
        infoView.addSubViews(nameLabel, ratingLabel, descriptionTextView, trailerWebView)
    }
    
    private func addConstraints() {
        // scrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        // movieImage
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        movieImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        movieImage.heightAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        // infoView
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 178).isActive = true
        infoView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 943).isActive = true
        // nameLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 197).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        // ratingLabel
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        ratingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        // descriptionTextView
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 13).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 138).isActive = true
        // trailerWebView
        trailerWebView.translatesAutoresizingMaskIntoConstraints = false
        trailerWebView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 24).isActive = true
        trailerWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        trailerWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        trailerWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    private func setUpUI() {
        // view
        view.backgroundColor = AppColor.backgroundColorWithWhite
        // scrollView
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1200)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        // infoView
        infoView.backgroundColor = AppColor.backgroundColorWithWhite
        infoView.layer.cornerRadius = 16
        // nameLabel
        nameLabel.font = .manrope(ofSize: 24, weight: .semiBold)
        nameLabel.numberOfLines = 3
        nameLabel.textAlignment = .left
        // descriptionTextView
        descriptionTextView.font = .manrope(ofSize: 16, weight: .regular)
        descriptionTextView.backgroundColor = AppColor.backgroundColorWithWhite
        descriptionTextView.textColor = AppColor.font
        descriptionTextView.isEditable = false
    }
    
    // MARK: Private
    private func addInfoMovie() {
        movieImage.image = movieInfo.imageMovie
        nameLabel.text = movieInfo.name
        descriptionTextView.text = movieInfo.description
        addRatingAndYearLabelInfo()
        trailerWebView.load(URLRequest(url: movieInfo.youtubeLink))
    }
    
    private func addRatingAndYearLabelInfo() {
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "star")
        let attachmentString = NSMutableAttributedString(attachment: attachment)
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: AppColor.font, NSAttributedString.Key.font: UIFont.manrope(ofSize: 16, weight: .bold)]
        let secondAttributes = [NSAttributedString.Key.foregroundColor: AppColor.font, NSAttributedString.Key.font: UIFont.manrope(ofSize: 16, weight: .light)]
        let thirdAttributes = [NSAttributedString.Key.foregroundColor:
                                UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1),
                               NSAttributedString.Key.font:
                                UIFont.manrope(ofSize: 16, weight: .light)]
        let firstString = NSMutableAttributedString(string: "   \(movieInfo.rating)", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "/10 ", attributes: secondAttributes)
        let thirdString = NSAttributedString(string: " \(movieInfo.releaseDate)", attributes: thirdAttributes)
        attachmentString.append(firstString)
        attachmentString.append(secondString)
        attachmentString.append(thirdString)
        ratingLabel.attributedText = attachmentString
    }
}
