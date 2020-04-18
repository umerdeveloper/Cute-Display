//
//  ImagesSelectionVC.swift
//  Cute-Display
//
//  Created by Umer Khan on 18/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class ChoosedImagesVC: UIViewController {
    
    
    let bgImage             = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configurebgImage()
        
    }
    
    fileprivate func configureView() {
        self.view.backgroundColor = .white
    }
    
    fileprivate func configurebgImage() {
        view.addSubview(bgImage)
        bgImage.image = UIImage(named: "profile")
        bgImage.contentMode = .top
        
        
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        
        bgImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bgImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bgImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bgImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    
    
    
    
}
