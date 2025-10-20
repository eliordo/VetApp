import UIKit

class MainViewController: UIViewController {
    private var pets: [Pet] = []
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mascotas"
        view.backgroundColor = .systemBackground
        setupTableView()
        loadPets()
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PetCell.self, forCellReuseIdentifier: PetCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func loadPets() {
        guard let url = Bundle.main.url(forResource: "mascotas", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: url)
            pets = try JSONDecoder().decode([Pet].self, from: data)
            tableView.reloadData()
        } catch {
            print("Error loading mascotas.json: \(error)")
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PetCell.reuseIdentifier, for: indexPath) as? PetCell else {
            return UITableViewCell()
        }
        cell.configure(with: pets[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let pet = pets[indexPath.row]
        let detalleVC = DetalleViewController(pet: pet)
        navigationController?.pushViewController(detalleVC, animated: true)
    }
}
