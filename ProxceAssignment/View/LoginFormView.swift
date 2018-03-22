//
//  LoginFormView.swift
//  ProxceAssignment
//
//  Created by Samiksha on 22/03/18.
//  Copyright © 2018 Samiksha. All rights reserved.
//

import UIKit
import SnapKit

class LoginFormView: UIView {
    
    // Textfields
    let emailTextField: UITextField = UITextField()
    
    let passwordTextField: UITextField = UITextField()

    //    MARK: setup methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createLoginFormView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //    MARK: setup methods
    
    func createLoginFormView() {
        setupTextField()
        setupAppearance()
        
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        
        emailTextField.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.snp.left).offset(15)
            make.right.equalTo(self.snp.right).offset(-15)
            make.top.equalTo(self.snp.top).offset(15)
            make.height.equalTo(45)
        }
        
        passwordTextField.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(emailTextField.snp.left)
            make.right.equalTo(emailTextField.snp.right)
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
    func setupTextField() {
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocorrectionType = .no
        emailTextField.spellCheckingType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.enablesReturnKeyAutomatically = true
        emailTextField.textAlignment = .center
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocorrectionType = .no
        passwordTextField.spellCheckingType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.enablesReturnKeyAutomatically = true
        passwordTextField.textAlignment = .center
    }
    
    //    MARK: appearance methods
    
    func setupAppearance() {
        setupPlaceholders()
        setupColor()
        setupFontFamily()
        
        emailTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderWidth = 1.0
        self.layer.borderWidth = 1.0
        
        emailTextField.layer.cornerRadius = 5
        passwordTextField.layer.cornerRadius = 5
        self.layer.cornerRadius = 5
    }
    
    func setupPlaceholders() {
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
    }
    
    func setupColor() {
        self.backgroundColor = UIColor.clear
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        emailTextField.backgroundColor = UIColor.white
        passwordTextField.backgroundColor = UIColor.white
        
        emailTextField.textColor = UIColor.darkGray
        passwordTextField.textColor = UIColor.darkGray
    }
    
    func setupFontFamily() {
        emailTextField.font = UIFont.systemFont(ofSize: 12)
        passwordTextField.font = UIFont.systemFont(ofSize: 12)
    }
}
