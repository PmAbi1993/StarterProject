//
//  File.swift
//  StarterProject
//
//  Created by Binshad on 14/12/17.
//  Copyright © 2017 PmABi. All rights reserved.
//

import Foundation

extension String {
    
    /**
        Removes the whole whitespaces withing the provided string
     */
    func pm_removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
