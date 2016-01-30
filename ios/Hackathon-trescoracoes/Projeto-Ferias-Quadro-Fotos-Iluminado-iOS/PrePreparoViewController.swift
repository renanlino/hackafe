//
//  PrePreparoViewController.swift
//  Hackathon-trescoracoes
//
//  Created by Humberto on 1/30/16.
//  Copyright © 2016 Humberto Vieira de Castro. All rights reserved.
//

import UIKit

class PrePreparoViewController: UIViewController, DispositivosBluetoothProtocol {
    
    let dispositivosViewController = DispositivosTableViewController()
    
    override func viewDidLoad() {
        
        dispositivosViewController.delegate = self
        
    }
    
    
    
    func retornaBluetooth(retorno: String) {
        // Mostra o resultado do bluetooth
        
        // Se for sucesso
        //performSegueWithIdentifier("segueResultado", sender: self)
    }
    
    func desconectou() {
        // Se desconectar avisar feedback para a pessoa após o loading
    }
    
    
    @IBAction func definirHorario(sender: AnyObject) {
        
    }
    
    @IBAction func podePreparar(sender: AnyObject) {
        let opcao = Singleton.sharedInstance.cafeAtual
        performSegueWithIdentifier("segueResultado", sender: self)

        if opcao == "coffee" {
            //DispositivosTableViewController.writeValue("BTN=1")
        } else if opcao == "express" {
            //DispositivosTableViewController.writeValue("BTN=2")
        }else if opcao == "tea" {
            //DispositivosTableViewController.writeValue("BTN=3")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backItem = UIBarButtonItem()
        
        self.navigationController?.navigationBar.tintColor = UIColor.grayColor()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
}
