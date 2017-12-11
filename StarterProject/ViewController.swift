//
//  ViewController.swift
//  StarterProject
//
//  Created by Binshad on 15/11/17.
//  Copyright © 2017 PmABi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
       
        let frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 50)
        let slider = PMSliderDistributable(frame: frame)
        slider.makeBlockBars = true
        slider.barheight = 10
        view.addSubview(slider)
        
        
        
    }
    
}

