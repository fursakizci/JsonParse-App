//
//  ViewController.swift
//  Json_segway1
//
//  Created by Furkan sakızcı on 30.07.2019.
//  Copyright © 2019 Furkan sakızcı. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var name : String?
    
    @IBOutlet weak var myLabel: UILabel!
    
   override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.numberOfLines = 0
        myLabel.text = name
        
    }


}

