//
//  ViewController.swift
//  KPPickerView
// 
//  Created By: Kushal Panchal
//  Created on: 08/12/17 12:06 PM
//  
//  Copyright © 2017 Kushal Panchal All rights reserved.
//  
//  


import UIKit

class ViewController: UIViewController {
    
    private var strSelected: String = ""
    
    let objPickerView = KPPickerView.getInstanceFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(UIScreen.main.isCaptured)
        NotificationCenter.default.addObserver(self, selector: #selector(screenCaptured(_:)), name: NSNotification.Name.UIScreenCapturedDidChange, object: nil)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil, queue: OperationQueue.main) { (notificaiton) in
            print(notificaiton.userInfo ?? "NIL")
        }
        
    }
    
    @objc func screenCaptured(_ notification : NSNotification) {
        print(UIScreen.main.isCaptured)
    }

    @objc func screenShotCaptured(_ notification : NSNotification) {
        print(UIScreen.main.isCaptured)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showUIPickerView(_ sender: UIButton) {
        
        // Create an object
        
        setupUIPickerView(objPickerView)
        
        objPickerView.show(self, sender: sender, data: ["One", "Two", "Three", "four"], defaultSelected: strSelected) { (selectedObject, selectedIndex) in
            print(selectedObject)
            print(selectedIndex)
            self.strSelected = selectedObject as? String ?? ""
        }
        
    }
    
    fileprivate func setupUIPickerView(_ objView: KPPickerView) {
        // Set your default configuration here such as background color, button title, button title color etc.
        objView.config.btnDoneTitle = "Click here to Confirm"
        objView.config.footerBackgroundColor = UIColor.orange
    }
    

}

