//
//  Extentions.swift
//  SpacedAutolayout
//
//  Created by Chandrakant Naik on 30/03/21.
//

import UIKit

extension UITextField {
    @IBInspectable
    var rightImage: UIImage {
        get {
            return self.rightImage
        }
        set {
            let iconView = UIImageView(frame: CGRect(x: 0, y: 8, width: 20, height: 20))
            iconView.image = newValue
            iconView.contentMode = .scaleAspectFill
            let iconContainerView: UIView = UIView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
            iconContainerView.addSubview(iconView)
            rightView = iconContainerView
            rightViewMode = .always
        }
    }
    
    @IBInspectable
    var lefImage: UIImage {
        get {
            return self.lefImage
        }
        set {
            let iconView = UIImageView(frame: CGRect(x: 10, y: 8, width: 20, height: 20))
            iconView.contentMode = .scaleAspectFill
            iconView.image = newValue
            let iconContainerView: UIView = UIView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
            iconContainerView.addSubview(iconView)
            leftView = iconContainerView
            leftViewMode = .always
        }
    }
    
    func applyGradient(colors: [CGColor]) {
        let gradient = CAGradientLayer()
        gradient.frame =  self.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.colors = colors

        let shape = CAShapeLayer()
        shape.lineWidth = 6
        // shape.path = UIBezierPath(rect: self.bounds).cgPath
        shape.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 8).cgPath


        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        self.layer.addSublayer(gradient)
    }
}
    
    extension UIButton {
        func applyGradient(colors: [CGColor]) {
            self.backgroundColor = nil
            self.layoutIfNeeded()
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = colors
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = self.frame.height/2
            
            gradientLayer.shadowColor = UIColor.darkGray.cgColor
            gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
            gradientLayer.shadowRadius = 5.0
            gradientLayer.shadowOpacity = 0.3
            gradientLayer.masksToBounds = false
            
            self.layer.insertSublayer(gradientLayer, at: 0)
            self.contentVerticalAlignment = .center
            self.setTitleColor(UIColor.white, for: .normal)
            //  self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
            self.titleLabel?.textColor = UIColor.white
        }
    }
