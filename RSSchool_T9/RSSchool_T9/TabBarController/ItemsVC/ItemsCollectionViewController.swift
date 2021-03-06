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
        navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
    }
    
    // MARK: - Properties
    
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
            collectionView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
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
    
    override func viewWillTransition(to size: CGSize,
                            with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}



// MARK: - UICollectionViewDelegateFlowLayout
extension ItemsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if view.safeAreaLayoutGuide.layoutFrame.width > view.safeAreaLayoutGuide.layoutFrame.height {
//            print("horizontal")
            let height = (collectionView.frame.height * 0.9) // UIScreen.main.bounds.width * 0.40
            return CGSize(width: height * 0.8, height: height)
        } else {
//            print("vertical")
            let width = (collectionView.frame.width - 80) / 2 // UIScreen.main.bounds.width * 0.40
            return CGSize(width: width, height: width*11/9)
        }
    }
    
}


// MARK: - UICollectionViewDelegate & Data Source
extension ItemsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FillingData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let obj = FillingData.data[indexPath.item]
        
        switch obj {
        case .story(let story):
            cell.imageView.image = story.coverImage
            cell.titleLabel.text = story.title.trimmingCharacters(in: NSCharacterSet.newlines)
            cell.typeLabel.text = story.type
            cell.paths = story.paths
            cell.text = story.text
        case .gallery(let gallery):
            cell.imageView.image = gallery.coverImage
            cell.titleLabel.text = gallery.title
            cell.typeLabel.text = gallery.type
            cell.images = gallery.images
        }
        
        cell.navigationController = self.navigationController!
        
        return cell
    }
    
    
}
