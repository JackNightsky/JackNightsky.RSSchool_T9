//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 3.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ImageViewer: UIViewController {
    
    let image: UIImage
    var scrollView: ImageScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // Do any additional setup after loading the view.
        
        scrollView = ImageScrollView(frame: view.bounds)
        scrollView.imageViewer = self
        
        setupImageScrollView()
        setupCloseButton()
        
        scrollView.set(image: image)
        
    } // viewDidLoad()
    
    init(_ image: UIImage ) {
        self.image = image
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setupImageScrollView() {
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }

    
    func setupCloseButton() {
        view.addSubview(closeButton)
        
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 44 + 30).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
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
        btn.backgroundColor = self.view.backgroundColor?.withAlphaComponent(0.5)
        btn.contentMode = .scaleAspectFill // not compress image
        btn.clipsToBounds = true  // clips image's places which not fit in view

        btn.addTarget(self, action:#selector(closeVC(_:)), for: .touchDown)
        return btn
    }()

    @objc func closeVC(_ sender : UIButton) {
//        print("scrollView.contentSize:", scrollView.contentSize)
        self.dismiss(animated: true, completion: nil)
    }
    
}
