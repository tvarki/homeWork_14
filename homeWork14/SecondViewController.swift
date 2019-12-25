//
//  SecondViewController.swift
//  homeWork14
//
//  Created by Дмитрий Яковлев on 24.12.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - save value on viewVillDissapear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            let tmp : NameTelephone = NameTelephone(name: nameLabel.text, telephone: phoneLabel.text)
            let service = SaveService()
            service.saveToFile(content: tmp)

        }
    }
}
