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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        collectionView.dataSource = self
        collectionView.delegate = self

        let imageNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]
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

    private func appendImage(_ imageNames: [String]){
        for imageName in imageNames {
            if let image = UIImage(named: imageName) {
                images.append(image)
            } else {
                print("Image named \(imageName) not found")
            }
        }
    }
}

extension PhotoGalleryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cells = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("Failed to dequeue CustomCollectionViewCell in HomeViewController")
        }
        let image = images[indexPath.row]
        cells.config(with: image)
        return cells
    }
}
