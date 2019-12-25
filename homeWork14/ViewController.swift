//
//  ViewController.swift
//  homeWork14
//
//  Created by Дмитрий Яковлев on 24.12.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let service = SaveService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginValueChanged(_ sender: UITextField) {
        service.writeToUserDefaults(str: sender.text ?? "", key: "login")
    }
    
    @IBAction func passwordValueChanged(_ sender: UITextField) {
        service.writeToUserDefaults(str: sender.text ?? "", key: "password")
    }
    
    @IBAction func loginDidEnd(_ sender: UITextField) {
//        service.writeToUserDefaults(str: sender.text ?? "", key: "login")
    }
    
    @IBAction func passwordDidEnd(_ sender: UITextField) {
//        service.writeToUserDefaults(str: sender.text ?? "", key: "password")
    }
   
}

