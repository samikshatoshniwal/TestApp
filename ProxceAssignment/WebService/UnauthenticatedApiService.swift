//
//  UnauthenticatedApi.swift
//  ProxceAssignment
//
//  Created by Samiksha on 22/03/18.
//  Copyright © 2018 Samiksha. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UnAuthenticatedRestAPIService: NSObject {
    
    static let shared = UnAuthenticatedRestAPIService()
    
    func getCountryData(completionHandler:((_ success: Bool, _ error: Error?, _ response: [Country]?)->())?) {
        
        Alamofire.request("http://services.groupkt.com/country/get/all", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                if response.response?.statusCode == 200 && response.data != nil {
                    let json = JSON(response.data!)
                    let responseDict = json.dictionary
                    let restResponse = responseDict!["RestResponse"]?.dictionary
                    let resultArray = restResponse!["result"]?.array
                    var countryArray: [Country] = [Country]()
                    for result in resultArray! {
                        let country = Country.init(json: result.dictionary!)
                        countryArray.append(country)
                    }
                    if completionHandler != nil {
                        DispatchQueue.main.async {
                            completionHandler!(true, nil, countryArray)
                        }
                    }
                }
            case .failure(let error):
                if completionHandler != nil {
                    DispatchQueue.main.async {
                        completionHandler!(false, error, nil)
                    }
                }
            }
        }
    }
}
