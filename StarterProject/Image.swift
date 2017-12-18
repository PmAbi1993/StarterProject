//
//  Image.swift
//  StarterProject
//
//  Created by Binshad on 04/12/17.
//  Copyright © 2017 PmABi. All rights reserved.
//

import UIKit

extension UIImage {

    
    /**
        Provides a solid color for the whole imageview
     */
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

    
}
