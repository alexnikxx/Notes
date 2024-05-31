//
//  ListOfNotesViewController.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 27/05/24.
//

import UIKit

final class ListOfNotesViewController: UIViewController, ScreenEditViewControllerDelegate {
    let notebook = FileNotebook()

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", image: nil, target: self, action: #selector(editButtonTapped))

        tableView.dataSource = self
        tableView.delegate = self

        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    private func setupView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    @objc func plusButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "ScreenEditViewControllerID") as? ScreenEditViewController {
            viewController.delegate = self
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

    @objc func editButtonTapped() {
        tableView.isEditing.toggle()
    }

    func saveNote(note: Note) {
        notebook.add(note)
        print("Note saved: \(note.title)")
        print(notebook.notes)
    }
}

extension ListOfNotesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notebook.notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("The TableView could not dequeue a CustomCell in FirstTabViewController")
        }
        let note = notebook.notes[indexPath.row]
        cell.updateCell(note: note)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Prototype Cells"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "ScreenEditViewControllerID") as? ScreenEditViewController {
            let note = notebook.notes[indexPath.row]
            viewController.note = note
            self.navigationController?.pushViewController(viewController, animated: true)
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let note = notebook.notes[indexPath.row]
            notebook.remove(with: note.uid)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
