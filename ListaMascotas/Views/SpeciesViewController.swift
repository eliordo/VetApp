import UIKit

class SpeciesViewController: UIViewController {
    private var species: [Species] = []
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Especies"
        view.backgroundColor = .systemBackground
        setupTableView()
        loadData()
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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

    private func loadData() {
        guard let url = Bundle.main.url(forResource: "lista_data", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: url)
            species = try JSONDecoder().decode([Species].self, from: data)
            tableView.reloadData()
        } catch {
            print("Error loading lista_data.json: \(error)")
        }
    }
}

extension SpeciesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        species.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = species[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let s = species[indexPath.row]
        let vc = BreedsViewController(species: s)
        navigationController?.pushViewController(vc, animated: true)
    }
}
