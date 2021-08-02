//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 2.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ContentViewController: UIViewController, UIScrollViewDelegate {

    let scrollView = UIScrollView()
    let contentView = UIView()
    let image: UIImage
    let titleText: String
    let typeText: String
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        // Do any additional setup after loading the view.
        self.view.addSubview(closeButton)
        self.view.addSubview(headerView)
        
        imageView.image = image
        headerView.addSubview(imageView)
        
        typeLabel.text = typeText
        headerView.addSubview(titleLabel)
        headerView.addSubview(typeLabel)
        headerView.addSubview(separatorLine)
        
        NSLayoutConstraint.activate([
            
            closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 44 + 30),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            
            headerView.heightAnchor.constraint(equalToConstant: 530),
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 44 + 30 + 40 + 30),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            
            
            imageView.topAnchor.constraint(equalTo: headerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -58),
            imageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),

            typeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            typeLabel.centerYAnchor.constraint(equalTo: imageView.bottomAnchor),
            typeLabel.heightAnchor.constraint(equalToConstant: typeLabel.intrinsicContentSize.height + 16),
            typeLabel.widthAnchor.constraint(equalToConstant: typeLabel.intrinsicContentSize.width + 60),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -30),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -55),
            
            
            separatorLine.heightAnchor.constraint(equalToConstant: 1),
//            separatorLine.h.constraint(equalToConstant: 1),
            separatorLine.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 100),
            separatorLine.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -100),
            separatorLine.centerYAnchor.constraint(equalTo: headerView.bottomAnchor),
        ])
        
    }
    
    
    init(_ cell: CollectionViewCell)
    {
        self.image = cell.imageView.image!
        self.titleText = cell.titleLabel.text!
        self.typeText = cell.typeLabel.text!

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
    }
    
    lazy var closeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(systemName: "xmark"), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.tintColor = .white
        btn.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        btn.layer.cornerRadius = 20
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = self.view.backgroundColor
        btn.contentMode = .scaleAspectFill // not compress image
        btn.clipsToBounds = true  // clips image's places which not fit in view

        btn.addTarget(self, action:#selector(closeVC(_:)), for: .touchDown)
        return btn
    }()

    @objc func closeVC(_ sender : UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.frame = CGRect.init(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 500)
        view.contentMode = .scaleAspectFill // not compress image
        view.clipsToBounds = false  // clips image's places which not fit in view
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var imageView: CellImageView = {
        let view = CellImageView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFill // not compress image
        view.clipsToBounds = true  // clips image's places which not fit in view

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rockwell-Regular", size: 48)
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        label.attributedText = NSMutableAttributedString(string: self.titleText,
                                                         attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
//        label.backgroundColor = self.view.backgroundColor

        label.adjustsFontSizeToFitWidth = false
        label.adjustsFontForContentSizeCategory = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.font = UIFont(name: "Rockwell-Regular", size: 24)
        label.textColor = .white
        label.backgroundColor = self.view.backgroundColor
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.cornerRadius = 10
        
        label.numberOfLines = 1
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var separatorLine: UILabel = {
        let line = UILabel()
        line.frame = CGRect(x: 0, y: 0, width: 214, height: 2)
        line.backgroundColor = .white
        
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
}
