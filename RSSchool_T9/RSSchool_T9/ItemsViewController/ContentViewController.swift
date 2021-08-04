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
    let content = UIView()
    let image: UIImage
    let titleText: String
    let typeText: String
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        content.translatesAutoresizingMaskIntoConstraints = false
        content.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.frame.inset(by: UIEdgeInsets.init(top: 1000, left: 0, bottom: 100, right: 0))
        
        view.addSubview(scrollView)
        scrollView.addSubview(content)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        content.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        content.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        content.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
    }
    
    let stackOfContent: UIStackView = {
        let stack = UIStackView()

        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        stack.spacing = 40
        
        //        stack.sizeToFit()
        stack.backgroundColor = .systemIndigo
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    func setupStackOfContentStory() {

//        cell.paths
        // :-) article
        let article: UILabel
        article = UILabel()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        article.attributedText = NSMutableAttributedString(string: cell.text,
                                                         attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        article.textAlignment = .left
        article.font = UIFont(name: "Rockwell-Regular", size: 24)
        article.textColor = .white
        article.backgroundColor = self.view.backgroundColor
        article.layer.allowsEdgeAntialiasing = true
        article.lineBreakMode = .byWordWrapping
        article.numberOfLines = 0
        article.clipsToBounds = true
        article.translatesAutoresizingMaskIntoConstraints = false
        
        let articleSection: UIView
        articleSection = UIView()
        articleSection.layer.borderWidth = 1
        articleSection.layer.borderColor = UIColor.white.cgColor
        articleSection.layer.cornerRadius = 10
        
        articleSection.addSubview(article)
        stackOfContent.addSubview(articleSection)
        
        articleSection.translatesAutoresizingMaskIntoConstraints = false
        articleSection.topAnchor.constraint(equalTo: stackOfContent.topAnchor).isActive = true
        articleSection.leadingAnchor.constraint(equalTo: stackOfContent.leadingAnchor).isActive = true
        articleSection.trailingAnchor.constraint(equalTo: stackOfContent.trailingAnchor).isActive = true
        articleSection.bottomAnchor.constraint(equalTo: stackOfContent.bottomAnchor, constant: -30).isActive = true
        
        article.topAnchor.constraint(equalTo: articleSection.topAnchor, constant: 30).isActive = true
        article.leadingAnchor.constraint(equalTo: articleSection.leadingAnchor, constant: 30).isActive = true
        article.trailingAnchor.constraint(equalTo: articleSection.trailingAnchor, constant: -40).isActive = true
        article.bottomAnchor.constraint(equalTo: articleSection.bottomAnchor).isActive = true

    }
    
    func setupStackOfContentGallery() {
        for image in cell.images {
            
            let container: UIView
            container = UIView()
            container.layer.borderWidth = 1
            container.layer.borderColor = UIColor.white.cgColor
            container.layer.cornerRadius = 10
            
            container.translatesAutoresizingMaskIntoConstraints = false
            
            let imageView: UIImageView
            imageView = UIImageView.init(image: image)
            imageView.layer.cornerRadius = 10
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 1
            
            imageView.backgroundColor = .white
            imageView.contentMode = .scaleAspectFill // not compress image
            imageView.clipsToBounds = true  // clips image's places which not fit in view

            imageView.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(imageView)
            
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2 + 20).isActive = true
            imageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
            imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
            imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10).isActive = true
            imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10).isActive = true
            
            stackOfContent.addArrangedSubview(container)
        }
        stackOfContent.spacing = 20
    }
    
    
    
    
    func setupViews(){
        
        content.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: content.topAnchor, constant: 44 + 30).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -25).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        content.addSubview(subHeaderView)
        subHeaderView.heightAnchor.constraint(equalToConstant: 530).isActive = true
        subHeaderView.topAnchor.constraint(equalTo: content.topAnchor, constant: 44 + 30 + 40 + 30).isActive = true
        subHeaderView.leadingAnchor.constraint(equalTo: content.leadingAnchor).isActive = true
        subHeaderView.trailingAnchor.constraint(equalTo: content.trailingAnchor).isActive = true
        
        imageView.image = image
        subHeaderView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: subHeaderView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: subHeaderView.bottomAnchor, constant: -58).isActive = true
        imageView.leadingAnchor.constraint(equalTo: subHeaderView.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: subHeaderView.trailingAnchor, constant: -20).isActive = true
        
        subHeaderView.addSubview(typeLabel)
        typeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        typeLabel.centerYAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        typeLabel.heightAnchor.constraint(equalToConstant: typeLabel.intrinsicContentSize.height + 16).isActive = true
        typeLabel.widthAnchor.constraint(equalToConstant: typeLabel.intrinsicContentSize.width + 60).isActive = true
        
        subHeaderView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -30).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -55).isActive = true
        
        subHeaderView.addSubview(separatorLine)
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLine.leadingAnchor.constraint(equalTo: subHeaderView.leadingAnchor, constant: 100).isActive = true
        separatorLine.trailingAnchor.constraint(equalTo: subHeaderView.trailingAnchor, constant: -100).isActive = true
        separatorLine.centerYAnchor.constraint(equalTo: subHeaderView.bottomAnchor).isActive = true
        
        content.addSubview(stackOfContent)
//        stackOfContent.heightAnchor.constraint(equalToConstant: stackOfContent.intrinsicContentSize.height).isActive = true
//        stackOfContent.centerXAnchor.constraint(equalTo: content.centerXAnchor).isActive = true
        stackOfContent.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 40).isActive = true
//        stackOfContent.widthAnchor.constraint(equalTo: content.widthAnchor).isActive = true
        stackOfContent.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 20).isActive = true
        stackOfContent.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -20).isActive = true
        stackOfContent.bottomAnchor.constraint(equalTo: content.bottomAnchor).isActive = true
        
    }
    
    
    
    // MARK: - old code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        // Do any additional setup after loading the view.
        setupScrollView()
        setupViews()
        if self.typeText == "Story" {
            setupStackOfContentStory()
        } else {
            setupStackOfContentGallery()
        }
    }
    
    var cell: CollectionViewCell
    
    init(_ cell: CollectionViewCell)
    {
        self.image = cell.imageView.image!
        self.titleText = cell.titleLabel.text!
        self.typeText = cell.typeLabel.text!
        self.cell = cell

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
    
    
    lazy var subHeaderView: UIView = {
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
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        label.attributedText = NSMutableAttributedString(string: typeText,
                                                         attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
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
