//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 2.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ContentViewController: UIViewController {
//    let donor: CollectionViewCell
    let image: UIImage
    let titleText: String
    let typeText: String
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        // Do any additional setup after loading the view.
        self.view.addSubview(imageView)
        self.view.addSubview(closeButton)
        
        imageView.addSubview(typeLabel)
        imageView.addSubview(titleLabel)
        
        
        NSLayoutConstraint.activate([
            
            closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            
            
//            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10),
//            imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10),
//            imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8),
//            imageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8),

//            typeLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -13),
//            typeLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
//
//            titleLabel.bottomAnchor.constraint(equalTo: typeLabel.topAnchor, constant: -5),
//            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
//            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -5),

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
//        btn.image = UIImage.init(systemName: "cross")
//        btn.setTitle("X", for: .normal)
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
