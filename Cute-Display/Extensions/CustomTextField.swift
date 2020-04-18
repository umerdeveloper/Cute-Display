//
//  CustomTextField.swift
//  Cute-Display
//
//  Created by Umer Khan on 18/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    let inset: CGFloat = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeHolder: String, keyboardType: UITextContentType, isSecureField: Bool = false ) {
        super.init(frame: .zero)
        textContentType         = keyboardType
        self.placeholder        = placeHolder
        self.isSecureTextEntry  = isSecureField
        self.layer.cornerRadius = 12
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        background                  = UIImage(named: "textFieldBg")
        textColor                   = .black
        textAlignment               = .left
        font                        = UIFont(name: "Aviner", size: 18)
        
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 12
        
        autocorrectionType          = .no
        returnKeyType               = .go
    }
    
    override func textRect(forBounds: CGRect) -> CGRect {
        return forBounds.insetBy(dx: self.inset , dy: self.inset)
    }
    
    override func editingRect(forBounds: CGRect) -> CGRect {
        return forBounds.insetBy(dx: self.inset , dy: self.inset)
    }
    
    override func placeholderRect(forBounds: CGRect) -> CGRect {
        return forBounds.insetBy(dx: self.inset, dy: self.inset)
    }
}
