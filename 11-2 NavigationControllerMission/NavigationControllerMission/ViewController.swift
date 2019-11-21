//
//  ViewController.swift
//  NavigationControllerMission
//
//  Created by Soojung Shin on 2019/11/21.
//  Copyright © 2019 Soojung Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    
    var isOn = true
    var message: String = ""
    var isZoom = false

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var textMessage: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "TapEditBarButton" {
            editViewController.textSegueValue = "Segue By Bar Button"
        } else if segue.identifier == "TapEditButton" {
            editViewController.textSegueValue = "Segue By Button"
        }
        
        editViewController.isOn = isOn
        editViewController.message = textMessage.text!
        editViewController.isZoom = isZoom
        editViewController.delegate = self
    }

    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        textMessage.text = message
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        if self.isZoom != isZoom {
            self.isZoom = isZoom
            
            let scale:CGFloat = 2.0
            var newWidth:CGFloat, newHeight:CGFloat

            if isZoom {
                newWidth = imgView.frame.width * scale
                newHeight = imgView.frame.height * scale
            } else {
                newWidth = imgView.frame.width / scale
                newHeight = imgView.frame.height / scale
            }
            
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        }
    }
}

