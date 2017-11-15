//
//  LoginButton.swift
//  ApiTest
//
//  Created by Pm_Abi on 23/08/17.
//  Copyright © 2017 PmAbi. All rights reserved.
//

import UIKit

@IBDesignable
class LoginButton: UIButton {

    
    var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
    var progressView = UIProgressView(progressViewStyle: .bar)
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
    
        didSet{
           setCornerRadius()
        }
    
    }
    
    @IBInspectable var indicatorColor : UIColor = UIColor.white {
        
        didSet{
            setActivityIndicatorColor()
        }
        
    }

    @IBInspectable var underLineColor : UIColor = UIColor.green {
        
        didSet{
            updateColor()
        }
        
    }

    @IBInspectable var isIndicatorVisible : Bool = true {
        
        didSet{
            isIndicatorVisible = !isIndicatorVisible
            updateIndicatorVisibilty()
        }
        
    }

    
    
    @IBInspectable var progress : Double = 5 {
        
        didSet{
            
            updateProgress()
        
            
        }
    
    }
    
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        
        updateIndicatorVisibilty()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    override func draw(_ rect: CGRect) {

        activityIndicator.frame = CGRect(x: frame.width - 30, y: frame.size.height / 2, width: 0, height: 0)
        activityIndicator.isHidden = isIndicatorVisible
        activityIndicator.color = indicatorColor
        addSubview(activityIndicator)

        activityIndicator.startAnimating()
        progressView.frame = CGRect(x: 0, y: frame.size.height, width: frame.size.width, height: frame.size.height * 0.1)
        progressView.tintColor = underLineColor
        addSubview(progressView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicator.frame = CGRect(x: frame.width - 30, y: frame.size.height / 2, width: 0, height: 0)
        activityIndicator.isHidden = isIndicatorVisible

    }
    
 
    
    func updateProgress(){
    
        progressView.progress = Float(progress * 0.1)
        
    }
    func updateColor(){
        
        progressView.tintColor = underLineColor
        
    }
    func updateIndicatorVisibilty(){
        
        activityIndicator.isHidden = isIndicatorVisible
        
    }
    func setActivityIndicatorColor(){
        self.activityIndicator.color = indicatorColor
    
    }

    
    func setCornerRadius(){
    
        layer.cornerRadius = (frame.height / 2) - cornerRadius
    }
}
