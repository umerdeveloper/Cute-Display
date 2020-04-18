//
//  CollectionViewCell.swift
//  Cute-Display
//
//  Created by Umer Khan on 17/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
        let wallpaper: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "profile")
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(wallpaper)
        wallpaper.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        wallpaper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        wallpaper.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        wallpaper.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
