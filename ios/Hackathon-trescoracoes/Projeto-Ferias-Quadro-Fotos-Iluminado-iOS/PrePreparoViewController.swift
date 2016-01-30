//
//  PrePreparoViewController.swift
//  Hackathon-trescoracoes
//
//  Created by Ezequiel on 1/30/16.
//  Copyright © 2016 Humberto Vieira de Castro. All rights reserved.
//

import UIKit

class PrePreparoViewController: UIViewController, DispositivosBluetoothProtocol {
    
    @IBOutlet var datepicker: UIDatePicker!
    let dispositivosViewController = DispositivosTableViewController()
    
    override func viewDidLoad() {
        datepicker.hidden = true
        dispositivosViewController.delegate = self
        
    }
    
    func retornaBluetooth(retorno: String) {
        // Mostra o resultado do bluetooth
    }
    
    func desconectou() {
        // Se desconectar avisar feedback para a pessoa após o loading
    }
    
    @IBAction func definirHorario(sender: AnyObject) {
        //datepicker.hidden = false
    }
    
    @IBAction func podePreparar(sender: AnyObject) {
        let opcao = Singleton.sharedInstance.cafeAtual
        
        if opcao == "coffee" {
            //DispositivosTableViewController.writeValue("BTN=1")
        } else if opcao == "express" {
            //DispositivosTableViewController.writeValue("BTN=2")
        }else if opcao == "tea" {
            //DispositivosTableViewController.writeValue("BTN=3")
        }
        
        
    }
}
