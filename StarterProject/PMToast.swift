//
//  PMToast.swift
//  StarterProject
//
//  Created by Binshad on 24/11/17.
//  Copyright © 2017 PmABi. All rights reserved.
//

import Foundation
import UIKit

enum defaultSnackBarStatus {

    case loaded
    case notloaded
    
}

class PMSnackBar : UIView{


    static let show = PMSnackBar()
    var snackBarStatus : defaultSnackBarStatus = .notloaded
    var snackBarData : [String] = []
    
}


//MARK: default Static Instance


extension PMSnackBar{
    
    func normalSnackBar(in view : UIView, withText : String, autoHide : Bool){
      
        let height = view.frame.height / 12
        let initialFrame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: height)
        let finalFrame = CGRect(x: 0, y: view.frame.height - height, width: view.frame.width, height: height)
        let snackBar = UIView(frame: initialFrame)
        snackBar.tag = 999999
        snackBar.backgroundColor = UIColor(initWithHexString: EssentialConstants.ToastColor)

        switch snackBarStatus {
            case .notloaded:

            view.addSubview(snackBar)
            UIView.animate(withDuration: 0.4, animations: {
                snackBar.frame = finalFrame
            })
            snackBarStatus = .loaded
            
            case .loaded:
            
                for views in view.subviews{
                    
                    if views.tag == 999999{
                        UIView.animate(withDuration: 0.4, animations: {
                            snackBar.frame = initialFrame
                            
                        }, completion: { (completed) in
                            if completed {
                            }
                        })
                    }
                }
        }

    }

}
