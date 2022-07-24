//
//  ZMView.swift
//  VeriParkTest
//
//  Created by Zulqarnain Mustafa on 24/07/2022.
//

import UIKit

@IBDesignable
class ZMView: UIView {
    
    @IBInspectable var roundTopLeft:     Bool   = true
    @IBInspectable var roundTopRight:    Bool   = true
    @IBInspectable var roundBottomLeft:  Bool   = true
    @IBInspectable var roundBottomRight: Bool   = true
    
    
    @IBInspectable var isRound: Bool            = false
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupCorners()
        if self.isRound {
            self.shapeRound()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
        
    private func setupCorners() {
        
        var corners = CACornerMask()
        
        if roundTopLeft     { corners.formUnion(.layerMinXMinYCorner) }
        if roundTopRight    { corners.formUnion(.layerMaxXMinYCorner) }
        if roundBottomLeft  { corners.formUnion(.layerMinXMaxYCorner) }
        if roundBottomRight { corners.formUnion(.layerMaxXMaxYCorner) }

        layer.maskedCorners = corners
    }
    
    private func shapeRound() {
        layer.cornerRadius = self.frame.size.height / 2.0
    }

    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOffSet: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            self.layer.shadowOffset = shadowOffSet
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    //If you want to set shadow color never ever set view masktoBounds and cliptoBounds property to True
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius  = cornerRadius
            
            //           layer.masksToBounds = cornerRadius > 0
        }
        
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
}
