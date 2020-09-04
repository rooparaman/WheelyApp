// Created by Roopa Raman on 4/9/20
// Copyright © 2020 rr. All rights reserved.
// Using Swift 5.0

import UIKit

class Wheel : UIView {
    var numberOfSections: Int = 0
    private var section : [String] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, sections: [String]) {
        self.init (frame: frame)
        self.numberOfSections = sections.count
        self.section = sections
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        let angleSize: Double = Double.pi * 2 / Double ( numberOfSections )
        
        for i in 0..<numberOfSections {
            let sp = (CGFloat(i) * (100.0 / CGFloat(numberOfSections)))
            let ep = (CGFloat(i+1) * (100.0 / CGFloat(numberOfSections)))
            drawSlice(rect, startPercent: sp, endPercent: ep, color: UIColor(red: 255/254, green: 212/254, blue: 112/254, alpha: 0.5))
            
            
            let lbl = UILabel(frame: CGRect(x: 12, y: 10, width: (rect.width / 2) - 30 , height: 40))
            lbl.layer.anchorPoint = CGPoint(x: 1.0, y: 0.5)
            lbl.layer.position = CGPoint(x: self.bounds.size.width/2.0 + self.frame.origin.x,
                                         y: self.bounds.size.height/2.0 + self.frame.origin.y)
            lbl.transform = CGAffineTransform(rotationAngle: CGFloat ( angleSize ) * CGFloat (Double(i) - 0.5)  );
            lbl.text = section[i]
            
            lbl.textColor = UIColor(red: 87/254, green: 33/254, blue: 9/254, alpha: 1.0)
            
            lbl.textAlignment = .left
            self.addSubview(lbl)
        }
    }
    
    private func drawSlice(_ rect: CGRect, startPercent: CGFloat, endPercent: CGFloat, color: UIColor) {
        let center = CGPoint(x: rect.origin.x + rect.width / 2, y: rect.origin.y + rect.height / 2)
        let radius = min(rect.width, rect.height) / 2
        let startAngle = startPercent / 100 * CGFloat(Double.pi) * 2 - CGFloat(Double.pi)
        let endAngle = endPercent / 100 * CGFloat(Double.pi) * 2 - CGFloat(Double.pi)
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.close()
        path.stroke()
        color.setFill()
        path.fill()
        
    }
}
