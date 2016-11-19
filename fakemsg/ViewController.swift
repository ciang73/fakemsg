//
//  ViewController.swift
//  fakemsg
//
//  Created by CK on 2016/11/19.
//  Copyright © 2016年 CK. All rights reserved.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {
    @IBOutlet weak var messageArea: UITextView!
    @IBOutlet weak var TitleArea: UITextField!
    @IBOutlet weak var SubTitleArea: UITextField!
    
//    var titleStr: String
//    var subTitleStr: String
//    var bodyStr: String
    
    @IBAction func submit(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
//        content.
        content.title = (TitleArea.text == nil ? "none" : TitleArea.text!)
        content.subtitle = (SubTitleArea.text == nil ? "none" : SubTitleArea.text!)
        content.body = (messageArea.text == nil ? "none" : messageArea.text!)
//        content.badge = 1
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 點任意處關閉KB
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(ViewController.hideKeyboard(tapG:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        //
        
        
        // Do any additional setup after loading the view, typically from a nib.
        //messageArea.text = "回我電話"
        messageArea.keyboardType = .default
        messageArea.returnKeyType = .default
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func hideKeyboard(tapG: UITapGestureRecognizer){
        // 除了使用 self.view.endEditing(true)
        // 也可以用 resignFirstResponder()
        // 來針對一個元件隱藏鍵盤
        self.messageArea.resignFirstResponder()
    }
}

