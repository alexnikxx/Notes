//
//  CustomCell.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 30/05/24.
//

import UIKit

final class CustomCell: UITableViewCell {
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
            color.trailingAnchor.constraint(equalTo: title.leadingAnchor, constant: -12),
            color.heightAnchor.constraint(equalToConstant: 20),
            color.widthAnchor.constraint(equalTo: color.heightAnchor),
            color.centerXAnchor.constraint(equalTo: title.centerXAnchor),

            title.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            title.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),

            text.topAnchor.constraint(equalTo: color.bottomAnchor, constant: 12),
            text.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            text.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }

    func updateCell(note: Note) {
        color.backgroundColor = note.color
        title.text = note.title
        text.text = note.content
    }
}
