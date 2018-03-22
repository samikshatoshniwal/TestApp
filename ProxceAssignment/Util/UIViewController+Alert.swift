//
//  UIViewController+Alert.swift
//  ProxceAssignment
//
//  Created by Samiksha on 22/03/18.
//  Copyright © 2018 Samiksha. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(withTitle title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func showAlert(withTitle title: String?, message: String?, cancelButtonTitle: String, otherButtonTitle: String, cancelButtonPostHandler cancelHandler: (()->())?, otherButtonPostHandler otherHandler: @escaping ()->()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action1 = UIAlertAction.init(title: cancelButtonTitle, style: .cancel) { (action) in
            alert.dismiss(animated: true, completion: nil)
            if cancelHandler != nil {
                cancelHandler!()
            }
        }
        alert.addAction(action1)
        
        let action2 = UIAlertAction.init(title: otherButtonTitle, style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
            otherHandler()
        }
        alert.addAction(action2)
        present(alert, animated: true)
    }
}
