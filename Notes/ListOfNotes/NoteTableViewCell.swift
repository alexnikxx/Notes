//
//  CustomCell.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 30/05/24.
//

import UIKit

final class NoteTableViewCell: UITableViewCell {
    static let identifier = "CustomCell"

    private let color: UIView = {
        let color = UIView()
        color.backgroundColor = .red
        color.translatesAutoresizingMaskIntoConstraints = false
        return color
    }()

    private let title: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let text: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .gray
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.contentView.addSubview(color)
        self.contentView.addSubview(title)
        self.contentView.addSubview(text)

        NSLayoutConstraint.activate([
            color.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            color.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            color.heightAnchor.constraint(equalToConstant: 20),
            color.widthAnchor.constraint(equalTo: color.heightAnchor),
            color.centerYAnchor.constraint(equalTo: title.centerYAnchor),

            title.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            title.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            title.leadingAnchor.constraint(equalTo: color.trailingAnchor, constant: 8),

            text.topAnchor.constraint(equalTo: color.bottomAnchor, constant: 4),
            text.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            text.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            text.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }

    func update(note: Note) {
        color.backgroundColor = note.color
        title.text = note.title
        text.text = note.content
    }
}