//
//  ZMTextField.swift
//  VeriParkTest
//
//  Created by Zulqarnain Mustafa on 24/07/2022.
//

import UIKit

class ZMTextField: UITextField {

    @IBInspectable var placeholderColor: UIColor        = UIColor.lightGray
    @IBInspectable var placeholderFont: String          = "Roboto-Regular"
    @IBInspectable var placeholderFontSize: Double          = 12.0
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupPlaceholder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupPlaceholder() {
        
        self.attributedPlaceholder =  NSAttributedString(
            string: self.placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor, NSAttributedString.Key.font: UIFont(name: placeholderFont, size: placeholderFontSize) ?? UIFont.systemFont(ofSize: placeholderFontSize)]
        )
    }
    
}
