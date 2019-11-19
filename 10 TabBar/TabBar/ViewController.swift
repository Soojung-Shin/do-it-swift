//
//  ViewController.swift
//  TabBar
//
//  Created by Soojung Shin on 2019/11/19.
//  Copyright © 2019 Soojung Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func btnMovePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
}

