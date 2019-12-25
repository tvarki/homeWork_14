//
//  ThirdViewController.swift
//  homeWork14
//
//  Created by Дмитрий Яковлев on 24.12.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    
    
    
    let saveService = SaveService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        login.text = saveService.getFromUserDefaults(key: "login")
        password.text = saveService.getFromUserDefaults(key: "password")

        guard let tmp = saveService.readFromFile() else{ return }
        phoneLabel.text = tmp.telephone
        nameLabel.text = tmp.name
    
    }

    @IBAction func clearLogin(_ sender: UIButton){
        login.text = ""
        saveService.writeToUserDefaults(str: "", key: "login")
    }
    
    @IBAction func clearPassword(_ sender: UIButton){
        password.text = ""
        saveService.writeToUserDefaults(str: "", key: "password")
    }
    
    @IBAction func clearPhone(_ sender: UIButton){
        var tmp = saveService.readFromFile()
        phoneLabel.text = ""
        if tmp == nil {
            tmp = NameTelephone(name: "", telephone: "")
        }
        saveService.saveToFile(content: NameTelephone(name: tmp?.name, telephone: ""))
    }
    
    @IBAction func clearName(_ sender: UIButton){
        var tmp = saveService.readFromFile()
        nameLabel.text = ""
        if tmp == nil {
            tmp = NameTelephone(name: "", telephone: "")
        }
        saveService.saveToFile(content: NameTelephone(name: "", telephone: tmp?.telephone))
    }
    
    
    @IBAction func clearAll(_ sender: UIButton){
        let tmp = UIButton()
        clearName(tmp)
        clearLogin(tmp)
        clearPhone(tmp)
        clearPassword(tmp)
    }
    

    func clearMemory(){
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
