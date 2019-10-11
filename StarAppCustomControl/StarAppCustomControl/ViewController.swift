//
//  ViewController.swift
//  StarAppCustomControl
//
//  Created by Lambda_School_Loaner_167 on 10/10/19.
//  Copyright © 2019 Dani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        var titleString = "User Rating: \(ratingControl.value)"
        titleString += ratingControl.value == 1 ? " star" : " stars"
        title = titleString
    }
    
    


}

