//
//  ViewController.swift
//  PageControlMission
//
//  Created by Soojung Shin on 2019/11/19.
//  Copyright © 2019 Soojung Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblPageNumber: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.darkGray
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        
        lblPageNumber.text = "1"
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        lblPageNumber.text = String(sender.currentPage + 1)
    }
}

