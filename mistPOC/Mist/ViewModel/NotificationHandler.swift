//
//  File.swift
//  mistPOC
//
//  Created by Guru Narayanan on 06/03/23.
//

import Foundation
import UserNotifications

/// Class to Handle All the Notification related things
///```
/// Steps:
/// 1. Declare the Current Notification Center.
/// 2. Ask for the permission and check the status.
///     2.1 if permission granted we are good to go.
///     2.2 otherwise Provide the Error message to Client.
/// 3. Create a Notification Content.
/// 4. Create Notification Trigger.
/// 5. Send the Notification Request to the NotificationCenter Queue.
///```

class NotificationHandler{
   
    /// 1. Declares Notification Center
    let notificationCenter = UNUserNotificationCenter.current()
    
    /// 1. Initializer will call requestAuthorization
    init() {
        requestAuthorization()
    }
    
    ///2. Asks for a Permission
    func requestAuthorization(){
        notificationCenter.requestAuthorization(options:  [.badge, .sound, .alert]) { granted, error in
            if(granted)
            {
                print("We are good to go")
            }
            else{
                print("there is an error \(error?.localizedDescription ?? "")")
            }
        }
    }
    	
    ///3. create Notification Content
    func createNotificationContent(title : String, body : String, badge : Int) -> UNMutableNotificationContent{
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = title
        notificationContent.body = body
        notificationContent.badge = NSNumber(integerLiteral: badge)
        notificationContent.sound = .default
        
        return notificationContent
    }
    
    ///4. Create NotificationTrigger
    func createNotificationTrigger( timeInterval : Double = 1000) -> UNNotificationTrigger {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        return trigger
    }
    
    ///5. sendNotification
    func sendNotification(content : UNMutableNotificationContent, trigger : UNNotificationTrigger){
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        notificationCenter.add(request) { error in
            if let error = error{
                print(error)
            }
        }
    }
}
