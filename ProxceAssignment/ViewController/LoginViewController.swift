//
//  LoginViewController.swift
//  ProxceAssignment
//
//  Created by Samiksha on 21/03/18.
//  Copyright © 2018 Samiksha. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var loginFormView: LoginFormView = LoginFormView()
    let loginButton: UIButton = UIButton()
    
    class func fromStoryboard() -> LoginViewController {
        let loginViewController = UIStoryboard (name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as! LoginViewController
        return loginViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
    }
    
    //  MARK: setup methods
    
    func setupView() {
        loginFormView = LoginFormView.init(frame: CGRect.init(origin: CGPoint.init(x: 15, y: view.center.y - 50), size: CGSize.init(width: view.frame.width - 30, height: 135)))
        self.view.addSubview(loginFormView)
        self.view.addSubview(loginButton)
        setupAppearance()
        
        loginButton.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(view.snp.width).multipliedBy(0.8)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(loginFormView.snp.bottom).offset(25)
            make.height.equalTo(45)
        }
    }
    
    func setupNavigationBar() {
        title = "Login"
    }
    
    // MARK: action methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let valid = validateFields()
        if valid {
            if segue.identifier == "showCountryListVC", let destinationViewController = segue.destination as? CountryListViewController {
                destinationViewController.email = loginFormView.emailTextField.text
                destinationViewController.transitioningDelegate = self
                destinationViewController.modalPresentationStyle = .custom
            }
        }
    }
    
    @objc func loginButtonPressed() {
        performSegue(withIdentifier: "showCountryListVC", sender: self)
    }
    
    func validateFields() -> Bool {
        if (loginFormView.emailTextField.text?.isEmpty)! {
            showAlert(withTitle: "Email cannot be blank", message: nil)
            return false
        } else if (loginFormView.emailTextField.text?.isValidEmail())! == false {
            showAlert(withTitle: "Enter valid email id", message: nil)
        } else if (loginFormView.passwordTextField.text?.isEmpty)! {
            showAlert(withTitle: "Password cannot be blank", message: nil)
            return false
        }
        return true
    }
    // MARK: appearance methods
    
    func setupAppearance() {
        setupButton()
        setupColor()
        setupFontFamily()
    }
    
    func setupButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.addTarget(self, action: #selector(LoginViewController.loginButtonPressed), for: .touchUpInside)
    }
    
    func setupColor() {
        view.backgroundColor = UIColor(red: 238/255, green: 245/255, blue: 254/255, alpha: 1.0)
        loginButton.backgroundColor = UIColor(red: 73/255, green: 155/255, blue: 202/255, alpha: 1.0)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.layer.borderColor = UIColor.white.cgColor
    }
    
    func setupFontFamily() {
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
}

extension LoginViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let presentationAnimator = TransitionPresentationAnimator()
        return presentationAnimator
    }
}
