//
//  ViewController.swift
//  WebApp
//
//  Created by Soojung Shin on 2019/11/18.
//  Copyright © 2019 Soojung Shin. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var myWebView: WKWebView!
    
    func loadIndexPage() {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadIndexPage()
    }

    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    
    @IBAction func btnDone(_ sender: UIBarButtonItem) {
        loadIndexPage()
    }
}

