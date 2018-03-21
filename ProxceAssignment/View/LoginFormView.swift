//
//  LoginView.swift
//  ProxceAssignment
//
//  Created by Samiksha on 22/03/18.
//  Copyright © 2018 Samiksha. All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    var label: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addCustomView() {
        label.frame = CGRect.init(origin: .zero, size: CGSize.init(width: 200, height: 200))
        label.backgroundColor = UIColor.red
        label.textAlignment = .center
        label.text = "test label"
//        label.hidden=true
        self.addSubview(label)
//
//        var btn: UIButton = UIButton()
//        btn.frame=CGRectMake(50, 120, 200, 100)
//        btn.backgroundColor=UIColor.redColor()
//        btn.setTitle("button", forState: UIControlState.Normal)
//        btn.addTarget(self, action: "changeLabel", forControlEvents: UIControlEvents.TouchUpInside)
//        self.addSubview(btn)
//
//        var txtField : UITextField = UITextField()
//        txtField.frame = CGRectMake(50, 250, 100,50)
//        txtField.backgroundColor = UIColor.grayColor()
//        self.addSubview(txtField)
    }
}
