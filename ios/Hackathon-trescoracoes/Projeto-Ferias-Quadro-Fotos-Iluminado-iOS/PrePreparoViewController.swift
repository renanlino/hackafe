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
        print("Pode aqui")
    }
    
    func desconectou() {
        // Se desconectar avisar feedback para a pessoa após o loading
    }
    
    
    @IBAction func definirHorario(sender: AnyObject) {
        
    }
    
    @IBAction func podePreparar(sender: AnyObject) {
        let opcao = Singleton.sharedInstance.cafeAtual

        if opcao == "coffee" {
            DispositivosTableViewController.writeValue("BUT=1\r\n")
        } else if opcao == "express" {
            DispositivosTableViewController.writeValue("BUT=2\r\n")
        }else if opcao == "tea" {
            DispositivosTableViewController.writeValue("BUT=3\r\n")
        }
        performSegueWithIdentifier("segueResultado", sender: self)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backItem = UIBarButtonItem()
        
        self.navigationController?.navigationBar.tintColor = UIColor.grayColor()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
}
