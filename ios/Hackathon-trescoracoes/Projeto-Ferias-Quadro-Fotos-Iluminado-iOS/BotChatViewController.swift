//
//  BotViewController.swift
//  Projeto-Ferias-Quadro-Fotos-Iluminado-iOS
//
//  Created by Humberto Vieira de Castro on 1/28/16.
//  Copyright © 2016 Humberto Vieira de Castro. All rights reserved.
//

import UIKit

class BotChatViewController: JSQMessagesViewController, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var pickerLibrary : UIImagePickerController?
    var arrayMessages:Array<JSQMessage!> = []
    
    
    /* Configurar o jeito o layout chat da imagem */
    var outgoingBubbleImageData: JSQMessagesBubbleImage?
    var incomingBubbleImageData: JSQMessagesBubbleImage?
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        /* Deixa a bolha da mensagem elástica */
        self.collectionView!.collectionViewLayout.springinessEnabled = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Configurando delegates */
        pickerLibrary = UIImagePickerController()
        pickerLibrary?.delegate = self
        
        Singleton.sharedInstance.remetente = "Bot Cafeteira"
        
        
        /* Configurando pessoa que envia */
        self.showLoadEarlierMessagesHeader = false
        
        
        self.title = "Cafeteira Bot"
        
        /* Configura celulas de envio e recebimento (layout) */
        let bubbleFactory:JSQMessagesBubbleImageFactory = JSQMessagesBubbleImageFactory()
        
        self.outgoingBubbleImageData = bubbleFactory.outgoingMessagesBubbleImageWithColor(UIColor(red: 124/255, green: 83/255, blue: 117/255, alpha: 1))
        self.incomingBubbleImageData = bubbleFactory.incomingMessagesBubbleImageWithColor(UIColor(red: 100/255, green: 90/255, blue: 103/255, alpha: 1))
        
    }
    
    func addMessageBot(message: String) {
        
        
        
        let message = JSQMessage(senderId: "bot", senderDisplayName: Singleton.sharedInstance.remetente, date: NSDate(), text: message)
        
        self.arrayMessages.append(message)
    }
    
    
    
}
