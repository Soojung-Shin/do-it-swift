//
//  ViewController.swift
//  ImageViewer
//
//  Created by Soojung Shin on 2019/11/18.
//  Copyright © 2019 Soojung Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imgName: Array<String>?
    var currentIdx: Int = 0
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgName = ["01.png", "02.png", "03.png", "04.png", "05.png"]
        imgView.image = UIImage(named: imgName![currentIdx])
    }

    @IBAction func btnPrevClick(_ sender: UIButton) {
        currentIdx -= 1
        
        if (currentIdx < 0) {
            currentIdx = imgName!.count - 1
        }
        
        imgView.image = UIImage(named: imgName![currentIdx])
    }
    
    @IBAction func btnNextClick(_ sender: UIButton) {
        currentIdx += 1
        
        if (currentIdx == imgName!.count) {
            currentIdx = 0
        }
        
        imgView.image = UIImage(named: imgName![currentIdx])
    }

}

