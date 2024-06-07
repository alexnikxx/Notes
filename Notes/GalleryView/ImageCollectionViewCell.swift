//
//  CustomCollectionViewCell.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 31/05/24.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let imageBorder: UIView = {
        let border = UIView()
        border.layer.borderColor = UIColor.gray.cgColor
        border.layer.borderWidth = 1
        border.translatesAutoresizingMaskIntoConstraints = false
        return border
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(with image: UIImage){
        let resizedImage = image.resize(to: bounds.size)
        imageView.image = resizedImage
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

    private func setupView(){
        contentView.addSubview(imageView)
        contentView.addSubview(imageBorder)

        NSLayoutConstraint.activate([
            imageBorder.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageBorder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageBorder.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageBorder.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            imageView.topAnchor.constraint(equalTo: imageBorder.topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: imageBorder.bottomAnchor, constant: -8),
            imageView.leadingAnchor.constraint(equalTo: imageBorder.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: imageBorder.trailingAnchor, constant: -8),
        ])
    }
}

#warning("Change this method")
extension UIImage {
    func resize(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
