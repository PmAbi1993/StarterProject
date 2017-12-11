//
//  PMSlider.swift
//  StarterProject
//
//  Created by Binshad on 04/12/17.
//  Copyright © 2017 PmABi. All rights reserved.
//

import UIKit


@IBDesignable class PMSlider: UISlider {

    @IBInspectable var barHeight : CGFloat = 20
    
    @IBInspectable var makeBlockBars : Bool = false{
    
        didSet{
            if makeBlockBars{
                makeSquareBars()
            }
        }
    }
    
    
//    override func draw(_ rect: CGRect) {
//           }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {

        var newBounds = super.trackRect(forBounds: bounds)
        newBounds.size.height = barHeight
        return newBounds
        
    }
    
    func makeSquareBars(){

        let image = UIImage().getImageWithColor(color: UIColor.red, size: frame.size)
        let image2 = UIImage().getImageWithColor(color: UIColor.blue, size: frame.size)
        thumbTintColor = UIColor(initWithHexString: "#929292")
        setMinimumTrackImage(image, for: UIControlState.normal)
        setMaximumTrackImage(image2, for: UIControlState.normal)
    }
    
    
   
}
