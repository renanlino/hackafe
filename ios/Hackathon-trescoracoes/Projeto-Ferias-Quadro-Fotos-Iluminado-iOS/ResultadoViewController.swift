//
//  ResultadoViewController.swift
//  Hackathon-trescoracoes
//
//  Created by Humberto Vieira de Castro on 1/30/16.
//  Copyright © 2016 Humberto Vieira de Castro. All rights reserved.
//

import UIKit
import Social

class ResultadoViewController: UIViewController, DispositivosBluetoothProtocol {
    @IBOutlet var imageViewCoffe: UIImageView!
    
    @IBOutlet var imageViewBackground: UIImageView!
    @IBOutlet var labelStatus: UILabel!
    
    let dispositivosViewController = Singleton.sharedInstance.dispositivosBluetooth
    
    var numExec = 0
    
    
    override func viewDidLoad() {
        numExec = 0
        dispositivosViewController!.delegate = self
        
        let opcao = Singleton.sharedInstance.cafeAtual
        
        if opcao == "coffee" {
            self.imageViewBackground.image = UIImage(named: "circle_red")
            self.imageViewCoffe.image = UIImage(named: "cafe_big")
        } else if opcao == "express" {
            self.imageViewBackground.image = UIImage(named: "circle_green")
            self.imageViewCoffe.image = UIImage(named: "expresso_big")
            
        }else if opcao == "tea" {
            self.imageViewBackground.image = UIImage(named: "circle_blue2")
            self.imageViewCoffe.image = UIImage(named: "cha_big")
            
        }
        
    }
    
    @IBAction func shareWithTwitter(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            let twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText("Agora é hora de cafézinho na Campus Party pela 3 Corações! 😀😊💙 #CPBR9 #3CORACOES #HORADOCAFE")
            self.presentViewController(twitterSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Contas", message: "Por favor, logue com o Twitter para compartilhar", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func shareWithFace(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText("Agora é hora de cafézinho na Campus Party pela 3 Corações! #CPBR9 #3CORACOES #HORADOCAFE")
            self.presentViewController(facebookSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Contas", message: "Por favor, logue com o Facebook para compartilhar", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func retornaBluetooth(retorno: String) {
        if retorno != "STS+" {
            if retorno == "00111\r\nSTS+" {
                self.labelStatus.text = "Seu cafézinho está pronto! "
                if numExec == 0 {
                    numExec = 1
                    let alert = UIAlertView(title: "Sua bebida está pronta", message: "", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                }
                
                
            }
            print("Retorno ResultadoView Controller - \(retorno)")
            DispositivosTableViewController.writeValue("STS\r\n")
        }
    }
    
    func desconectou() {
        print("Desconectou Resultado View Controller")
    }
    
    
}
