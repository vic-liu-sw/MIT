//
//  ViewController.swift
//  test1
//
//  Created by vic_liu on 2018/4/14.
//  Copyright © 2018年 vic_liu. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    var localButton:UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        localButton = UIButton()
        localButton.backgroundColor = UIColor.black
        localButton.setImage(UIImage(named: "localButton"), for: UIControlState.normal)
        localButton.setTitleColor(UIColor(red: 0,
                                       green: 122/255, blue: 1, alpha: 1),
                               for: .normal)
       
        
        
        
        view.addSubview(localButton)
       
        localButton.translatesAutoresizingMaskIntoConstraints = false
        localButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        localButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
            localButton.addTarget(self, action: #selector(handleButtonOnTapped(button:)), for: UIControlEvents.touchUpInside)
    
    }
    
    @objc func handleButtonOnTapped(button: UIButton){
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "測試本地通知"
        notificationContent.subtitle = "測試通知副標題"
        notificationContent.body = "測試本地圖之內容"
        notificationContent.badge = 1
        notificationContent.sound = UNNotificationSound.default()
        let imageURL: URL = Bundle.main.url(forResource: "default", withExtension: "jpg")!
        let attachment = try! UNNotificationAttachment(identifier: "image", url: imageURL, options: nil)
        notificationContent.attachments = [attachment]
         notificationContent.userInfo = ["direct-link": "https:// www.google.com"]
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: notificationContent, trigger: trigger)
        
        
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {Error in print("建立通知")})
        
       
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


