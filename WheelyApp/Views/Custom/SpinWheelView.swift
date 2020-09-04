// Created by Roopa Raman on 4/9/20
// Copyright © 2020 rr. All rights reserved.
// Using Swift 5.0

import UIKit

class SpinWheelView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    var container: UIView?
    
    private var numberOfSections: Int = 0
    private var sections : [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init (frame: CGRect, sections: [String]) {
        self.init (frame: frame)
        self.numberOfSections = sections.count
        self.sections = sections
        drawWheel ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawWheel() {
        
        container = UIView (frame: frame)
        
        let spinWheel = Wheel(frame: CGRect(x: self.center.x, y: self.center.y, width: 300.0, height: 300.0), sections: sections)
        spinWheel.backgroundColor = UIColor.clear
        spinWheel.center = self.center
        container?.addSubview(spinWheel)
        container?.isUserInteractionEnabled = false;
        
        
        let wheelOutlineImg = UIImageView (frame: CGRect(x: 0, y: 0, width: 320, height: 320))
        wheelOutlineImg.center = center
        wheelOutlineImg.image = UIImage (named: Constants.wheelOutlineImage)
        
        let centerImg = UIImageView (frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        centerImg.center = center
        centerImg.image = UIImage (named: Constants.wheelCenterImage)
        
        addSubview (container!)
        addSubview(centerImg)
        addSubview (wheelOutlineImg)
        
    }
    
    @objc func touchedWheel(_ sender: UIButton){
        self.container?.rotate(sender)
    }
    
}
