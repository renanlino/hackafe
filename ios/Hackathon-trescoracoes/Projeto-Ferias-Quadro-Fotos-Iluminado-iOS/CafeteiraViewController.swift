//
//  CafeteiraViewController.swift
//  Projeto-Ferias-Quadro-Fotos-Iluminado-iOS
//
//  Created by Humberto Vieira de Castro on 1/28/16.
//  Copyright © 2016 Humberto Vieira de Castro. All rights reserved.
//

import UIKit

class CafeteiraViewController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func callCoffee(sender: AnyObject) {
        print("Ta Coffe")
        DispositivosTableViewController.writeValue("a")
        
    }
    
    @IBAction func callHotWater(sender: AnyObject) {
        print("Hot Water")
        DispositivosTableViewController.writeValue("b")
        
    }
    
    
    @IBAction func callColdWater(sender: AnyObject) {
        print("Cold Water")
        DispositivosTableViewController.writeValue("c")
        
        
    }
}
