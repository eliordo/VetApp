import UIKit

class PetCell: UITableViewCell {
    static let reuseIdentifier = "PetCell"

    private let petImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 6
        return iv
    }()

    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.preferredFont(forTextStyle: .headline)
        return lbl
    }()

    private let detailLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.preferredFont(forTextStyle: .subheadline)
        lbl.textColor = .secondaryLabel
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        contentView.addSubview(petImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(detailLabel)

        NSLayoutConstraint.activate([
            petImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            petImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            petImageView.widthAnchor.constraint(equalToConstant: 56),
            petImageView.heightAnchor.constraint(equalToConstant: 56),

            nameLabel.leadingAnchor.constraint(equalTo: petImageView.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            detailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            detailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    func configure(with pet: Pet) {
        nameLabel.text = pet.name
        detailLabel.text = "\(pet.type) • \(pet.age) años"
        if let imageName = pet.imageName, let image = UIImage(named: imageName) {
            petImageView.image = image
        } else {
            petImageView.image = UIImage(systemName: "pawprint.fill")
            petImageView.tintColor = .systemGray
        }
    }
}
