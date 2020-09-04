// Created by Roopa Raman on 4/9/20
// Copyright © 2020 rr. All rights reserved.
// Using Swift 5.0

import UIKit

extension UIView {

    func rotate(_ sender : UIButton) {
        var count: Int = 0
        let max: Int = Int.random(in: 30...50)
        Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { [weak self] (timer) in
            count += 1
            guard let s = self else {
                timer.invalidate()
                return
            }
            s.transform = s.transform.rotated(by: -0.5)
            if count == max {
                timer.invalidate()
                sender.isEnabled = true
            }
        }
    }
}
