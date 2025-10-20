import UIKit

class DetalleViewController: UIViewController {
    private let pet: Pet

    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        return iv
    }()

    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return lbl
    }()

    private let infoLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.preferredFont(forTextStyle: .body)
        lbl.textColor = .secondaryLabel
        lbl.numberOfLines = 0
        return lbl
    }()

    init(pet: Pet) {
        self.pet = pet
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        configure()
    }

    private func setupViews() {
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(infoLabel)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func configure() {
        nameLabel.text = pet.name
        // Mostrar 7 detalles
        var details = [String]()
        details.append("Tipo: \(pet.type)")
        details.append("Edad: \(pet.age)")
        details.append("Dueño: \(pet.owner ?? "-")")
        details.append("Microchip: \(pet.microchip ?? "-")")
        if let vac = pet.vaccinated {
            details.append("Vacunado: \(vac ? "Sí" : "No")")
        } else {
            details.append("Vacunado: -")
        }
        if let peso = pet.weight {
            details.append(String(format: "Peso: %.1f kg", peso))
        } else {
            details.append("Peso: -")
        }
        details.append("Género: \(pet.gender ?? "-") | Color: \(pet.color ?? "-")")

        infoLabel.text = details.joined(separator: "\n")
        if let imageName = pet.imageName, let image = UIImage(named: imageName) {
            imageView.image = image
        } else {
            imageView.image = UIImage(systemName: "pawprint.fill")
            imageView.tintColor = .systemGray
        }
    }
}
