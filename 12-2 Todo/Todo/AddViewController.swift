//
//  AddViewController.swift
//  Todo
//
//  Created by Soojung Shin on 2019/11/21.
//  Copyright © 2019 Soojung Shin. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var txtViewAddItemTitle: UITextField!
    @IBOutlet var txtViewAddItemContent: UITextView!
    @IBOutlet var imagePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: imageName[0])
        
        txtViewAddItemContent.layer.borderWidth = 1.0
        txtViewAddItemContent.layer.borderColor = UIColor.systemGray6.cgColor
        txtViewAddItemContent.layer.cornerRadius = 5
    }
        
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageName.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 30
    }
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = UIImage(named: imageName[row])
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: UIImage(named: imageName[row]))
        imageView.frame.size = CGSize(width: 30, height: 30)
        return imageView
    }
    

    @IBAction func btnAddItem(_ sender: UIButton) {
        let itemTitle = txtViewAddItemTitle.text!
        let itemContent = txtViewAddItemContent.text!
        
        if itemTitle == "" {
            let emptyTitleAlert = UIAlertController(title: "경고", message: "스케줄 이름을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            let emptyTitleAlertAction = UIAlertAction(title: "다시 입력하기", style: UIAlertAction.Style.default, handler: {
                ACTION in self.txtViewAddItemTitle.becomeFirstResponder()
            })
            emptyTitleAlert.addAction(emptyTitleAlertAction)
            present(emptyTitleAlert, animated: true, completion: nil)
        } else if itemContent == "" {
            let emptyContentAlert = UIAlertController(title: "경고", message: "스케줄 내용을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            let emptyContentAlertAction = UIAlertAction(title: "다시 입력하기", style: UIAlertAction.Style.default, handler: {
                ACTION in self.txtViewAddItemContent.becomeFirstResponder()
            })
            emptyContentAlert.addAction(emptyContentAlertAction)
            present(emptyContentAlert, animated: true, completion: nil)
        } else {
            itemTitles.append(itemTitle)
            itemContents.append(itemContent)
            itemImages.append(imagePicker.selectedRow(inComponent: 0))
            txtViewAddItemTitle.text = ""
            _ = navigationController?.popViewController(animated: true)
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
