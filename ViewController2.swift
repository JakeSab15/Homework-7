//
//  ViewController2.swift
//  Homework 7
//
//  Created by Jakob Sabatula on 5/4/20.
//  Copyright © 2020 Jakob Sabatula. All rights reserved.
//

import UIKit
import WebKit
import MessageUI


class ViewController2: UIViewController, MFMessageComposeViewControllerDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    }
    
    @IBAction func sendText(_ sender: Any) {
        let composeVC = MFMessageComposeViewController()
          composeVC.messageComposeDelegate = self
          
        
          composeVC.recipients = ["+7249704903"]
          composeVC.body = "Hello. This message is being sent from my app"
          
          if MFMessageComposeViewController.canSendText() {
               self.present(composeVC, animated: true, completion: nil)
          } else {
              print("Can't send messages.")
          }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.nycgo.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

        

        // Do any additional setup after loading the view.
    }

}
