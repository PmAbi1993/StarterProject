//
//  PMSliderDistributable.swift
//  StarterProject
//
//  Created by Binshad on 04/12/17.
//  Copyright © 2017 PmABi. All rights reserved.
//

import UIKit

@IBDesignable
class PMSliderDistributable: UISlider {

    
//    override func draw(_ rect: CGRect) {
//       
//    }


    @IBInspectable var barheight : CGFloat = 10{
        didSet{
            updateTracks()
        }
    }

    
    @IBInspectable var minimumTrackHexColor : String = "#000000"{
       didSet{
            updateTracks()
        }
    }
    
    @IBInspectable var maximumTrackHexColor : String = "#000000"{
        didSet{
            updateTracks()
        }
    }
    @IBInspectable var makeBlockBars : Bool = false{
        
        didSet{
            if makeBlockBars{
                updateTracks()
            }
        }
    }

    @IBInspectable var defaultImage : UIImage? = nil{
        
        didSet{
            setThumbImage(defaultImage, for: UIControlState.normal)
        }
    }
    @IBInspectable var selectedImage : UIImage? = nil{
        
        didSet{
            setThumbImage(selectedImage, for: UIControlState.selected)
        }
    }


    
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {

        var newBounds = super.trackRect(forBounds: bounds)
        newBounds.size.height = barheight
        return newBounds
    }
    
    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
    
        let new = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width, height: rect.height)
      
        return super.thumbRect(forBounds: bounds, trackRect: new, value: value)
    }
    
    private func setThumbDefaults(){
    
        let size = currentThumbImage?.size ?? CGSize(width: 10, height: 10)
        let color = thumbTintColor ?? UIColor(initWithHexString: "#929292")
        let image = getImageWithColor(color: color, size: size)
        setThumbImage(image, for: UIControlState.normal)
        setThumbImage(image, for: UIControlState.selected)

    }

    private func updateTracks(){
    
        
        let image = getImageWithColor(color: getColorFromHex(initWithHexString: minimumTrackHexColor), size: bounds.size)
        let image1 = getImageWithColor(color: getColorFromHex(initWithHexString: maximumTrackHexColor), size: bounds.size)
        setMinimumTrackImage(image, for: UIControlState.normal)
        setMaximumTrackImage(image1, for: UIControlState.normal)
    
    }

   
    
    private func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
   
    private func getColorFromHex(initWithHexString hexString: String) -> UIColor{
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        return  UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }


    
}
