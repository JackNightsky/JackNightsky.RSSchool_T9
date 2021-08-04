//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class Carousel: UICollectionView, SettingsDrawColor {
    func setDrawColor(_ drawColorHEX: String, andDrawStories drawStories: Bool) {
        self.drawColorHEX = drawColorHEX
        self.drawStories = drawStories
    }
    

    let paths: [CGPath]
    
    var drawColorHEX: String!
    var drawStories: Bool!
    
    var settings: SettingsViewController!
    
    init(_ paths: [CGPath]) {
        self.paths = paths
        
        
        print()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 100
//        layout.minimumInteritemSpacing = 50
        
        
        
        super.init(frame: .zero, collectionViewLayout: layout)
        contentInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 30)
        delegate = self
        dataSource = self
        register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.reuseId)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UICollectionViewDelegate & Data Source
extension Carousel: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paths.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.reuseId, for: indexPath) as! CarouselCell
        
        cell.path = paths[indexPath.item]
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.tintColor = UIColor.init(fromHexString: drawColorHEX)
        (cell as! CarouselCell).draw(drawStories)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as! CarouselCell).clear()
    }
}

extension Carousel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
    }
}
