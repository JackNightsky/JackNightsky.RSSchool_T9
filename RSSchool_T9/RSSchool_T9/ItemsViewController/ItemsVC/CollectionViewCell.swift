//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 2.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var navigationController: UINavigationController = UINavigationController()
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc: ContentViewController = ContentViewController(self)
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overFullScreen
        navigationController.modalPresentationCapturesStatusBarAppearance = false
        navigationController.present(vc, animated: true, completion: nil)

    }
    
    // MARK: - Properties
    var paths: [CGPath] = []
    var text: String = ""
    var images: [UIImage] = []
    
    
    lazy var imageView: CellImageView = {
        let view = CellImageView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFill // not compress image
        view.clipsToBounds = true  // clips image's places which not fit in view
        
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rockwell-regular", size: 16)
        label.textColor = .white
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
//        label.backgroundColor = .red
        
        label.adjustsFontSizeToFitWidth = false
        label.adjustsFontForContentSizeCategory = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rockwell-Regular", size: 12)
        label.textColor = UIColor(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}

// MARK: - UI Setup
extension CollectionViewCell {
    private func setupUI() {
//        self.backgroundColor = .black
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 18
        
        
        self.contentView.addSubview(imageView)
        imageView.addSubview(typeLabel)
        imageView.addSubview(titleLabel)
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8),
            imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8),
            
            typeLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -13),
            typeLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            
            titleLabel.bottomAnchor.constraint(equalTo: typeLabel.topAnchor, constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -5),
            
        ])
    }
}


