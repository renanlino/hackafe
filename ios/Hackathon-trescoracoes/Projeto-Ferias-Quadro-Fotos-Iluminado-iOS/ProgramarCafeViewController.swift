//
//  ProgramarCafeViewController.swift
//  Hackathon-trescoracoes
//
//  Created by Humberto Vieira de Castro on 1/30/16.
//  Copyright © 2016 Humberto Vieira de Castro. All rights reserved.
//

import UIKit
import PKHUD

class ProgramarCafeViewController: UIViewController {
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func buttonProgramar(sender: AnyObject) {
        var localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = ""
        localNotification.alertBody = "Seu café está sendo feito neste momento"
        localNotification.fireDate = datePicker.date
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        
        
        
    }
    
}
