//
//  Data.swift
//  CryptoCom
//
//  Created by Binshad on 30/10/17.
//  Copyright © 2017 GCSConsulting. All rights reserved.
//

import Foundation

extension Data{

    func responseToString() -> String?{
        
        if let response = String(data: self, encoding: .utf8){
            return response
        }else{
            return nil
        }
    }
}



