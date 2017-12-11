//
//  PmImageView.swift
//  StarterProject
//
//  Created by Binshad on 17/11/17.
//  Copyright © 2017 PmABi. All rights reserved.
//

import UIKit

@IBDesignable

class PmImageView: UIImageView {

   
    @IBInspectable var isCircular : Bool = false {
    
        didSet{

            if isCircular{
                makeSelfViewRounded()
            }
        }
    }

    
    
    
    func makeSelfViewRounded(){
    
        
        layer.cornerRadius = frame.size.width / 2
        self.clipsToBounds = true
        layer.masksToBounds = true
        setNeedsLayout()
    
    }
    
    
    override func draw(_ rect: CGRect) {
      
        if isCircular{
            
            let size = bounds.height > bounds.width ? bounds.height : bounds.width
            let newFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: size, height: size)
            
            print(size)
            frame = newFrame
            bounds = newFrame
            setNeedsDisplay()
            makeSelfViewRounded()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
