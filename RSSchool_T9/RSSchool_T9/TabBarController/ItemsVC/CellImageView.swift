//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 2.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class CellImageView: UIImageView {
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.9).cgColor,
            UIColor.black.withAlphaComponent(1).cgColor
        ]
        gradient.locations = [0.7, 1]
        return gradient
    }()

    
    init() {
        super.init(frame: .zero)
        self.layer.addSublayer(gradient)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.addSublayer(gradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layerWillDraw(_ layer: CALayer) {
        super.layerWillDraw(layer)
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradient.frame = self.bounds
    }

}
