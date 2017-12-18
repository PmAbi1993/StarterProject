//
//  UIView.swift
//  StarterProject
//
//  Created by Binshad on 29/11/17.
//  Copyright © 2017 PmABi. All rights reserved.
//

import Foundation
import UIKit


extension UIView{

    
    /**
     Makes the current view a model for flat card design
     */
    func makeViewAsDefaultcard(){
    
        layer.cornerRadius = 3
        layer.shadowColor = UIColor(red: 0/255.5, green: 0/255.5, blue: 0/255.5, alpha: 1.0).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.75)
        layer.shadowRadius = 1.7
        layer.shadowOpacity = 0.45
        
    }

    
    


}
