//
//  Country.swift
//  ProxceAssignment
//
//  Created by Samiksha on 22/03/18.
//  Copyright © 2018 Samiksha. All rights reserved.
//

import Foundation
import SwiftyJSON

let kName = "name"
let kAlpha2Code = "alpha2_code"
let kAlpha3Code = "alpha3_code"

class Country: NSObject {
    var name: String?
    var alpha2Code: String?
    var alpha3Code: String?
    
    init(name: String?, alpha2Code: String?, alpha3Code: String?) {
        self.name = name
        self.alpha2Code = alpha2Code
        self.alpha3Code = alpha3Code
    }
    
    init(json: [String: JSON]) {
        name = json[kName]?.string ?? ""
        alpha2Code = json[kAlpha2Code]?.string ?? ""
        alpha3Code = json[kAlpha3Code]?.string ?? ""
    }
}
