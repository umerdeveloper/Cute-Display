//
//  ImagesSelectionVC.swift
//  Cute-Display
//
//  Created by Umer Khan on 18/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class ChoosedImagesVC: UIViewController, UITextFieldDelegate {
    
    let containerView                   = UIView()
    
    let numberOfImagesLabel             = CustomLabel(textAlignment: .left)
    let numberOfImagesTextField         = CustomTextField(placeHolder: "Range 10 To 300", keyboardType: .telephoneNumber)
    
    let searchedImageLabel              = CustomLabel(textAlignment: .left)
    let searchedImageTextField          = CustomTextField(placeHolder: "e.g Flowers", keyboardType: .emailAddress)
    
    var numberOfImages: String          = "3"
    var searchImage: String             = "flower"
    let searchButton                    = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureContainerView()
        configureNumberOfImages()
        configureSearchedImage()
        configureSearchButton()
    }
    
    
    fileprivate func configureView() {
        self.view.backgroundColor = UIColor(red: 223/255, green: 249/255, blue: 251/255, alpha: 1)
    }
    
    fileprivate func configureContainerView() {
        
        self.view.addSubview(containerView)
        containerView.backgroundColor = UIColor(red: 199/255, green: 236/255, blue: 238/255, alpha: 1)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 12
        
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 320).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 320).isActive = true
    }
    
    fileprivate func configureNumberOfImages() {
        
        containerView.addSubview(numberOfImagesLabel)
        numberOfImagesLabel.text = "How Many Images"
        
        numberOfImagesLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        numberOfImagesLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        
        containerView.addSubview(numberOfImagesTextField)
        numberOfImagesTextField.topAnchor.constraint(equalTo: numberOfImagesLabel.bottomAnchor, constant: 10).isActive = true
        numberOfImagesTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        numberOfImagesTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        numberOfImagesTextField.backgroundColor = UIColor(red: 223/255, green: 249/255, blue: 251/255, alpha: 1)
    }
    
    fileprivate func configureSearchedImage() {
        
        containerView.addSubview(searchedImageLabel)
        searchedImageLabel.text = "Which Kind Of Image"
        
        searchedImageLabel.topAnchor.constraint(equalTo: numberOfImagesTextField.bottomAnchor, constant: 20).isActive = true
        searchedImageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        
        containerView.addSubview(searchedImageTextField)
        searchedImageTextField.topAnchor.constraint(equalTo: searchedImageLabel.bottomAnchor, constant: 10).isActive = true
        searchedImageTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        searchedImageTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        searchedImageTextField.backgroundColor = UIColor(red: 223/255, green: 249/255, blue: 251/255, alpha: 1)
        
    }
    
    
    
    
    
    
    fileprivate func configureSearchButton() {
        containerView.addSubview(searchButton)
        searchButton.setTitle("SEARCH", for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        searchButton.layer.cornerRadius = 12
        searchButton.setTitleColor(.white, for: .normal)
        //searchButton.backgroundColor = UIColor(red: 223/255, green: 249/255, blue: 251/255, alpha: 1)
        searchButton.backgroundColor = .darkGray
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        searchButton.topAnchor.constraint(equalTo: searchedImageTextField.bottomAnchor, constant: 25).isActive = true
        
        //searchButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        searchButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        searchButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
    @objc func searchButtonTapped() {
        
        if numberOfImagesTextField.text == "" || searchedImageTextField.text == "" {
            alertToUser(message: "All fields required")
        }
        
        let vc = ImagesCollectionVC()
        
        
        
        self.numberOfImages = self.numberOfImagesTextField.text!
        self.searchImage = self.searchedImageTextField.text!
        
        vc.numberOfImages = self.numberOfImages
        vc.searchedWallpaper = self.searchImage
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    
    private func alertToUser(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    
}
