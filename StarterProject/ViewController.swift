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
        
        var dat = JSON()
        
        dat["hello"] = "World"
        dat["world"] = "Hello"
        
        if let arr = Convert().stringArrayToJsonData(array: dat){
            print(arr.responseToString())
            
        }
    }
    
}

