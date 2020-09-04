// Created by Roopa Raman on 4/9/20
// Copyright © 2020 rr. All rights reserved.
// Using Swift 5.0

import UIKit

class WheelViewController: UIViewController {
    var options: [String] = []
    private var wheel  : SpinWheelView = SpinWheelView()
    
    @IBOutlet weak var containerView: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        wheel = SpinWheelView (frame: CGRect(x: 0, y: 0, width: 300, height: 300), sections: options)
        containerView.addSubview(wheel)
        view.addSubview(containerView)

    }

    @IBAction func spinClicked(_ sender: UIButton) {
        sender.isEnabled = false
        wheel.container?.rotate(sender)
    }

}
