//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class CarouselCell: UICollectionViewCell {
    
    var path: CGPath!
    var drawLayer = CAShapeLayer()
    
    var timer: Timer?
    var fireDate: Date?
    var time: TimeInterval = 1
    
    static let reuseId = "CarouselCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func draw(_ animated: Bool = false) {
        drawLayer.lineWidth = 1
        drawLayer.path = self.path
        drawLayer.strokeColor = tintColor.cgColor
        drawLayer.fillColor = nil
        drawLayer.strokeStart = 0
        drawLayer.strokeEnd = 0
         
        self.layer.addSublayer(drawLayer)
        
        if animated {
            animatePathChange(for: drawLayer, toPath: path)
            
            timer?.invalidate()
            
            let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [self] (timer) in
                if let fireDate = self.fireDate,
                   Date().timeIntervalSince1970 - fireDate.timeIntervalSince1970 <= time {
                    drawLayer.strokeEnd += 0.015
                } else {
                    timer.invalidate()
                }
            }
            self.timer = timer
            self.fireDate = Date()
            RunLoop.current.add(timer, forMode: .common)
        } else {
            drawLayer.strokeEnd = 1
        }
        
    }
    
    func clear() {
        drawLayer.strokeEnd = 0
    }
    
    
    
    func animatePathChange(for layer: CAShapeLayer, toPath: CGPath) {
        let animation = CABasicAnimation(keyPath: "path")
        animation.duration = 1.0
        animation.fromValue = 0 //layer.path
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        layer.add(animation, forKey: "strokeEnd")
    }
}
