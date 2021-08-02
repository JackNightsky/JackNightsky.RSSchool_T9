//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 2.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemsCollectionViewController: UIViewController {

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
        addCellsTitles()
    }
    
    
    func addCellsTitles() {
        for el in FillingData.data {
            switch el {
            case .story(let story):
                titles.append(story.title)
                types.append(story.type)
                coverImages.append(story.coverImage)
            case .gallery(let gallery):
                titles.append(gallery.title)
                types.append(gallery.type)
                coverImages.append(gallery.coverImage)
            }
        }
    }
    
    // MARK: - Properties
    var coverImages: [UIImage] = []
    var titles: [String] = []
    var types: [String] = []
    
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
}

// MARK: - UI Setup
extension ItemsCollectionViewController {
    private func setupUI() {

        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let cellWidthConstant: CGFloat = UIScreen.main.bounds.width * 0.43
        let cellHeightConstant: CGFloat = cellWidthConstant * 1.2

        layout.sectionInset = UIEdgeInsets(top: 40,
                                           left: 20,
                                           bottom: 40,
                                           right: 20)
        
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 30
        layout.itemSize = CGSize(width: cellWidthConstant, height: cellHeightConstant)
        
        return layout
    }
}

// MARK: - UICollectionViewDelegate & Data Source
extension ItemsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.imageView.image = coverImages[indexPath.item]
        cell.titleLabel.text = titles[indexPath.item]
        cell.typeLabel.text = types[indexPath.item]
        
        
        return cell
    }
    
}
