//
//  CustomCollectionViewCell.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 31/05/24.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "1")
        image.tintColor = .white
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    public func config(with image: UIImage){
        imageView.image = image
        setupView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

    private func setupView(){
        self.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
