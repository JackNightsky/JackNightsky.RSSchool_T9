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
        gradient.frame = CGRect.init(x: 0, y: 0, width: 160, height: 200)//view.frame
//        gradient.type = .axial
        gradient.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.9).cgColor,
            UIColor.black.withAlphaComponent(1).cgColor
        ]
//        gradient.
        gradient.locations = [0.7, 1]
        return gradient
    }()
    
    override func layerWillDraw(_ layer: CALayer) {
        super.layerWillDraw(layer)
        

    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradient.frame = self.bounds
        let layers1 = self.layer.sublayers
        self.layer.sublayers?.removeAll()
        self.layer.addSublayer(gradient)
        for layer in layers1! {
            self.layer.addSublayer(layer)
        }
        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
