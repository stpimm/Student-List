//
//  LoginViewController.swift
//  Student List
//
//  Created by Immanuel Sitepu on 30/11/23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text,
              !username.isEmpty,
              !password.isEmpty,
              username == "alfagift-admin" && password == "asdf" else {
            return
        }
        
        performSegue(withIdentifier: "ViewController", sender: self)
    }
    
}
