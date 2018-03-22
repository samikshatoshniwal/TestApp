//
//  CountryListTableViewCell.swift
//  ProxceAssignment
//
//  Created by Samiksha on 22/03/18.
//  Copyright © 2018 Samiksha. All rights reserved.
//

import UIKit

class CountryListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var actualContentView: UIView!
    @IBOutlet weak var nameHeaderLabel: UILabel!
    @IBOutlet weak var nameValueLabel: UILabel!
    @IBOutlet weak var alphaCode2HeaderLabel: UILabel!
    @IBOutlet weak var alphaCode2ValueLabel: UILabel!
    @IBOutlet weak var alphaCode3HeaderLabel: UILabel!
    @IBOutlet weak var alphaCode3ValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    class func identifier() -> String {
        return "\(self)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameValueLabel.text = nil
        alphaCode2ValueLabel.text = nil
        alphaCode3ValueLabel.text = nil
    }
    
    // MARK: Setup methods
    
    func setupView() {
        setupAppearance()
    }
    
    func setupCountryCell(withCountry country: Country) {
        nameValueLabel.text = country.name
        alphaCode2ValueLabel.text = country.alpha2Code
        alphaCode3ValueLabel.text = country.alpha3Code
    }
    
    func setupAppearance() {
        actualContentView.clipsToBounds = true
        actualContentView.layer.masksToBounds = true
        actualContentView.layer.cornerRadius = 6.0
        
        setupColor()
        setupFontFamily()
    }
    
    func setupFontFamily() {
        nameValueLabel.font = UIFont.systemFont(ofSize: 14)
        nameHeaderLabel.font = UIFont.systemFont(ofSize: 14)
        alphaCode2ValueLabel.font = UIFont.systemFont(ofSize: 14)
        alphaCode2HeaderLabel.font = UIFont.systemFont(ofSize: 14)
        alphaCode3ValueLabel.font = UIFont.systemFont(ofSize: 14)
        alphaCode3HeaderLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    func setupColor() {
        nameValueLabel.textColor = UIColor.darkGray
        alphaCode2ValueLabel.textColor = UIColor.darkGray
        alphaCode3ValueLabel.textColor = UIColor.darkGray
        nameHeaderLabel.textColor = UIColor.black
        alphaCode2HeaderLabel.textColor = UIColor.black
        alphaCode3HeaderLabel.textColor = UIColor.black
    }
}
