//
//  AddViewController.swift
//  TableViewController
//
//  Created by Soojung Shin on 2019/11/21.
//  Copyright © 2019 Soojung Shin. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append("clock")
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
