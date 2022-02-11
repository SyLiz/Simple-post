//
//  UtilityViewController.swift
//  Simple-post
//
//  Created by BOICOMP21070027 on 10/2/2565 BE.
//

import UIKit

class UtilityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}


extension UIImageView {

    func makeRounded() {
        self.layer.borderWidth = 0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

extension UIView {

  @IBInspectable var cornerRadius: CGFloat {

   get{
        return layer.cornerRadius
    }
    set {
        layer.cornerRadius = newValue
        layer.masksToBounds = newValue > 0
    }
  }

  @IBInspectable var borderWidth: CGFloat {
    get {
        return layer.borderWidth
    }
    set {
        layer.borderWidth = newValue
    }
  }

  @IBInspectable var borderColor: UIColor? {
    get {
        return UIColor(cgColor: layer.borderColor!)
    }
    set {
        layer.borderColor = newValue?.cgColor
    }
  }
    
    @IBInspectable var shadowColor: UIColor?{
           set {
               guard let uiColor = newValue else { return }
               layer.shadowColor = uiColor.cgColor
           }
           get{
               guard let color = layer.shadowColor else { return nil }
               return UIColor(cgColor: color)
           }
       }

       @IBInspectable var shadowOpacity: Float{
           set {
               layer.shadowOpacity = newValue
           }
           get{
               return layer.shadowOpacity
           }
       }

       @IBInspectable var shadowOffset: CGSize{
           set {
               layer.shadowOffset = newValue
           }
           get{
               return layer.shadowOffset
           }
       }

       @IBInspectable var shadowRadius: CGFloat{
           set {
               layer.shadowRadius = newValue
           }
           get{
               return layer.shadowRadius
           }
       }
}


