//
//  CustomLabel.swift
//  Cute-Display
//
//  Created by Umer Khan on 18/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont(name: "Aviner", size: 16)
        configure()
    }
    
    private func configure() {
        textColor                                 = .darkText
        adjustsFontSizeToFitWidth                 = true
        minimumScaleFactor                        = 0.9
        lineBreakMode                             = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }

}
