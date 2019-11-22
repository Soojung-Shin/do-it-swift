//
//  DetailViewController.swift
//  Todo
//
//  Created by Soojung Shin on 2019/11/21.
//  Copyright © 2019 Soojung Shin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var itemIndex: Int?

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblTitle.text = itemTitles[itemIndex!]
        lblContent.text = itemContents[itemIndex!]
        
        lblContent.sizeToFit()
    }
    
    
    func receiveItem(_ itemIndex: Int) {
        self.itemIndex = itemIndex
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
