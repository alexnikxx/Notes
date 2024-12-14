//
//  SecondTabViewController.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 27/05/24.
//

import UIKit

final class PhotoGalleryViewController: UIViewController {
    private var images = [UIImage]()

    private var collectionView: UICollectionView = {
        let numOfColumn = 3
        let width = (UIScreen.main.bounds.width - CGFloat((numOfColumn + 1) * 10)) / CGFloat(numOfColumn)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: width)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        collectionView.dataSource = self
        collectionView.delegate = self

        let imageNames = ["1", "2", "3", "4", "5", "7", "8", "9", "10", "11", "1", "2", "3", "4", "5", "7", "8", "9", "10", "11"]
        appendImage(imageNames)
        setupView()
    }

    private func setupView() {
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    private func appendImage(_ imageNames: [String]) {
        imageNames.forEach { image in
            if let image = UIImage(named: image) {
                images.append(image)
            } else {
                print("Image named \(image) not found")
            }
        }
    }
}

extension PhotoGalleryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cells = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            fatalError("Failed to dequeue CustomCollectionViewCell in HomeViewController")
        }
        let image = images[indexPath.row]
        cells.config(with: image)
        return cells
    }
}
