//
//  Data.swift
//  CryptoCom
//
//  Created by Pm_Abi on 30/10/17.
//  Copyright © 2017 GCSConsulting. All rights reserved.
//

import Foundation

extension Data{

    
    /**
     if the data is of string type, this will make sure it is converted and typecasted to string
     */
    func responseToString() -> String{
        
        if let response = String(data: self, encoding: .utf8){
            return response
        }else{
            return "Error in Transcoding values from data"
        }
        
    }
}



