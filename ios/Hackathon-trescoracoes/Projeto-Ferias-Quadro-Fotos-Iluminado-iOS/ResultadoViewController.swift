//
//  ResultadoViewController.swift
//  Hackathon-trescoracoes
//
//  Created by Humberto Vieira de Castro on 1/30/16.
//  Copyright © 2016 Humberto Vieira de Castro. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController {
    @IBOutlet var imageViewCoffe: UIImageView!
    
    @IBOutlet var imageViewBackground: UIImageView!
    @IBOutlet var labelStatus: UILabel!
    
    override func viewDidLoad() {
        Singleton.sharedInstance.cafeAtual = "tea"
        
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
    
}
