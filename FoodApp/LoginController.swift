//
//  LoginController.swift
//  FoodApp
//
//  Created by Mikayil on 07.12.24.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func login(_ sender: Any) {
        UserDefaults.standard.set("email", forKey: "email")
        UserDefaults.standard.set("password", forKey: "password")
        UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
        let controller = storyboard?.instantiateViewController(identifier: "FoodController") as! FoodController
        navigationController?.show(controller, sender: nil)
    }
    
    @IBAction func register(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "RegisterController") as! RegisterController
        navigationController?.show(controller, sender: nil)
    }
}
