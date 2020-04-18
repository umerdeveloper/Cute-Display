//
//  SceneDelegate.swift
//  Cute-Display
//
//  Created by Umer Khan on 17/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scen = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scen)
        window?.rootViewController = ChoosedImagesVC()
        window?.makeKeyAndVisible()
        
    }

}

