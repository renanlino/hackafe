//
//  CafeteiraViewController.swift
//  Projeto-Ferias-Quadro-Fotos-Iluminado-iOS
//
//  Created by Humberto Vieira de Castro on 1/28/16.
//  Copyright © 2016 Humberto Vieira de Castro. All rights reserved.
//

import UIKit

class CafeteiraViewController: UIViewController, DispositivosBluetoothProtocol {
    
    var dispositivosBluetooth = DispositivosTableViewController()
    
    override func viewDidLoad() {
        dispositivosBluetooth.delegate = self
    }
    
    @IBAction func callCoffee(sender: AnyObject) {
        DispositivosTableViewController.writeValue("STS\r\n")
    }
    
    
    func retornaBluetooth(retorno: String) {
        // Aqui ele irá alterar os status da tela!
        // colocar o algoritmo aqui em baixo com os status importantes a serem usados!
        print("Ta vindo pra cá e retornando coisas tops no delegate")
        DispositivosTableViewController.writeValue("STS\r\n")
    }
    
    func desconectou() {
        // Mostrar um popup na view e falar que a cafeteira desconectou com o bluetooth
        // Voltar para a tela de escolher a máquina de bluetooth
        
    }
    
    
    @IBAction func callHotWater(sender: AnyObject) {
        print("Hot Water")
        DispositivosTableViewController.writeValue("BUT=1\r\n")
    }
    
    
    @IBAction func callColdWater(sender: AnyObject) {
        print("Cold Water")
        DispositivosTableViewController.writeValue("START=client\r\n")
    }
}
