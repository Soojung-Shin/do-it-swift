//
//  EditViewController.swift
//  NavigationControllerMission
//
//  Created by Soojung Shin on 2019/11/21.
//  Copyright © 2019 Soojung Shin. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    
    var delegate: EditDelegate?
    var textSegueValue: String = ""
    var isOn = false
    var message: String = ""
    var isZoom = false

    @IBOutlet var lblSegue: UILabel!
    @IBOutlet var swLamp: UISwitch!
    @IBOutlet var textMessage: UITextField!
    @IBOutlet var btnImageExpand: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblSegue.text = textSegueValue
        swLamp.isOn = isOn
        textMessage.text = message
        
        if isZoom {
            btnImageExpand.setTitle("축소", for: .normal)
        } else {
            btnImageExpand.setTitle("확대", for: .normal)
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didMessageEditDone(self, message: textMessage.text!)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func btnExpandOnOff(_ sender: UIButton) {
        isZoom = !isZoom
        
        if isZoom {
            btnImageExpand.setTitle("축소", for: .normal)
        } else {
            btnImageExpand.setTitle("확대", for: .normal)
        }
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
