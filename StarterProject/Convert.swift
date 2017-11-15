//
//  Convert.swift
//  CryptoCom
//
//  Created by Binshad on 07/11/17.
//  Copyright © 2017 GCSConsulting. All rights reserved.
//

import Foundation

typealias JSON = [String : String]

class Convert {


    static let from = Convert()
    
    func stringArrayToJsonData(array: [String : Any]) -> Data?{
    
        var json : Data?
    
        do{
        
            let jsonData = try JSONSerialization.data(withJSONObject: array, options: .prettyPrinted)
            json = jsonData
            
        }catch{
            print(error.localizedDescription)
            
        }
        return json
    }
    
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
