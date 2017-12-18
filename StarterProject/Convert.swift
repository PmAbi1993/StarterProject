//
//  Convert.swift
//  CryptoCom
//
//  Created by Pm_Abi on 07/11/17.
//  Copyright © 2017 GCSConsulting. All rights reserved.
//

import Foundation

typealias JSON = [String : Any]

class Convert {

    static let from = Convert()

    /**
            Converts a JSON : [String : Any] to data format in one step. Should check for nil options too
     */
    
    func stringArrayToJsonData(array: JSON) -> Data?{
    
        var json : Data?
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: array, options: .prettyPrinted)
            json = jsonData
            
        }catch{
            print(error.localizedDescription)
        }
        return json
    }
    
    
    
    /**
     Converts a JSONData to -> [String : Any] . Check for chances to nil too
     */
    func jsonDataToStringArray(JsonData : Data) -> JSON?{
        var array : JSON?
        do{
           if let json = try JSONSerialization.jsonObject(with: JsonData, options: .allowFragments) as? JSON{
                array = json
           }else{
                let st = JsonData.responseToString()
                print(st ?? "The data is not in the right Format")
            }
        }catch{
            print(error.localizedDescription)
        }
        return array
    }
    
    /**
     Converts a JSONData to -> [JSON] . Check for chances to nil too
     */
    
    func jsonDataToStringArrayOfArray(JsonData : Data) -> [JSON]?{
        
        var array : [JSON]?
        
        do{
            if let json = try JSONSerialization.jsonObject(with: JsonData, options: .allowFragments) as? [JSON]{
                array = json
            }else{
                let st = JsonData.responseToString()
                print(st ?? "The data is not in the right Format")
            }
        }catch{
            print(error.localizedDescription)
        }
        
        return array
    }
}
