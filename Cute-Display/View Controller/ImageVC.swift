//
//  ImageViewController.swift
//  Cute-Display
//
//  Created by Umer Khan on 18/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit
import SDWebImage

class ImageVC: UIViewController {
    
    var imageURL: URL!          = nil
    let imageView               = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureImageView()
    }
    
    fileprivate func configureView() {
        self.view.backgroundColor = .white
    }
    
    fileprivate func configureImageView() {
        
        imageView.backgroundColor = .white
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        imageView.sd_setImage(with: imageURL)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true)
    }
    
}
