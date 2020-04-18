//
//  ViewController.swift
//  Cute-Display
//
//  Created by Umer Khan on 17/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    var imgArray                        = [String]()
    private let apiKey: String          = "13651762-bb2c92e1d09f606942de46d23"
    let searchBar                       = UISearchBar()
    var searchedWallpaper: String       = "girls"
    
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
        configureSearchBar()
        configureCollectionView()
        networking()
        
    }
    fileprivate func configureView() {
        self.view.backgroundColor = .white
    }
    
    fileprivate func configureSearchBar() {
        
        searchBar.searchBarStyle = .default
        searchBar.placeholder = "Search Wallpapers"
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
    }
    fileprivate func configureCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .white

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
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
        return imgArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        guard let validURL: URL = URL(string: imgArray[indexPath.row]) else { fatalError("Not valid image url") }
        //cell.wallpaper.load(url: validURL)
        cell.wallpaper.sd_setImage(with: validURL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ImageViewController()
        vc.modalPresentationStyle = .fullScreen
        guard let validURL: URL = URL(string: imgArray[indexPath.row]) else { fatalError("Not valid image url") }
        vc.imageURL = validURL
        present(vc, animated: true)
    }
}



extension ViewController {
    
    func networking() {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "pixabay.com"
        urlComponents.path = "/api/"
        
        let key = URLQueryItem(name: "key", value: apiKey)
        let searchedImage = URLQueryItem(name: "q", value: searchedWallpaper)
        let imageType = URLQueryItem(name: "image_type", value: "photo")
        let orientation = URLQueryItem(name: "orientation", value: "vertical")
        let safeSearch = URLQueryItem(name: "safesearch", value: "true")
        let perPage = URLQueryItem(name: "per_page", value: "5")
        let imageOrder = URLQueryItem(name: "order", value: "latest")
        
        
        urlComponents.queryItems = [imageType, orientation, key, searchedImage, safeSearch, perPage, imageOrder]
        
        guard let validURL = urlComponents.url else { return }
        
        let task = URLSession.shared.dataTask(with: validURL) { (data, response, error) in
            if error != nil || data == nil { return }
            
            do {
                let validJson = try JSONDecoder().decode(Json4Swift_Base.self, from: data!)
                self.jsonData(data: validJson)
            }
            catch { return }
        }
        task.resume()
    }
    
    
    func jsonData(data: Json4Swift_Base) {
        for index in 0..<data.hits!.count {
            let urlString = String((data.hits?[index].largeImageURL!)!)
            self.imgArray.append(urlString)
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension ViewController: UISearchBarDelegate {
    
}
