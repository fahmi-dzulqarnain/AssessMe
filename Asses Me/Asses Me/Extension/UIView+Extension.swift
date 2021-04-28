//
//  UIView+Extension.swift
//  Asses Me
//
//  Created by Fahmi Dzulqarnain on 27/04/21.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
