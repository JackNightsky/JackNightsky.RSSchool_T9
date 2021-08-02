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
    
    
    // MARK: - Properties
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
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .green
        
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .green
        
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .systemBlue
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
            imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10),
            
            titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            
            typeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            typeLabel.centerYAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10)
        ])
        
    }
}
