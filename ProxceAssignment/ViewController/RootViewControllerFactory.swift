//
//  RootViewControllerFactory.swift
//  ProxceAssignment
//
//  Created by Samiksha on 21/03/18.
//  Copyright © 2018 Samiksha. All rights reserved.
//

import UIKit

class RootViewControllerFactory: NSObject {
    
    class func configureRootViewController(forWindow window:UIWindow) -> UIViewController? {
        
        let loginViewController = LoginViewController.fromStoryboard()
        let navigationViewController = UINavigationController(rootViewController: loginViewController)
        setRootViewController(navigationViewController, toWindow: window)
        return loginViewController
    }
    
    class func setRootViewController(_ viewController: UIViewController, toWindow window:UIWindow) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
