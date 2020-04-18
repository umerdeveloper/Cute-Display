//
//  ViewController.swift
//  Cute-Display
//
//  Created by Umer Khan on 17/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imgArray = [String]()
    
    let apiKey: String              = "13651762-bb2c92e1d09f606942de46d23"
    let urlString: String           = "https://pixabay.com/api/"
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCollectionView()
        networking()
        print("ArrayItemsInViewDidLoad: \(imgArray.count)")
        
    }
    
    
    fileprivate func configureView() {
        self.view.backgroundColor = .white
    }
    
    
    
    fileprivate func configureCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .white

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 1.1, height: collectionView.frame.width / 2.2)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        return cell
    }
}



extension ViewController {
    
    func networking() {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "pixabay.com"
        urlComponents.path = "/api/"
        
        let searchedImage = URLQueryItem(name: "q", value: "car")
        let imageType = URLQueryItem(name: "image_type", value: "photo")
        let orientation = URLQueryItem(name: "orientation", value: "vertical")
        let key = URLQueryItem(name: "key", value: apiKey)
        
        urlComponents.queryItems = [imageType, orientation, key, searchedImage]
        
        guard let validURL = urlComponents.url else { return }
        
        let task = URLSession.shared.dataTask(with: validURL) { (data, response, error) in
            if error != nil { return }
            guard let validData = data else { return }
            
            do {
        
                let validJson = try JSONDecoder().decode(Json4Swift_Base.self, from: validData)
                self.jsonData(data: validJson)
                
            }
                
            catch { return }
            
        }
        task.resume()
    }
    
    
    func jsonData(data: Json4Swift_Base) {
        
        //print(data.hits?.count ?? 1)
        
        for index in 0..<data.hits!.count {
            
            let urlString = String((data.hits?[index].largeImageURL!)!)
            
            self.imgArray.append(urlString)
        }
        print("After Appending: \(imgArray.count)")
        
    }
    
    
    
    
    
}
