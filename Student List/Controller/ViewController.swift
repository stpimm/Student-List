//
//  ViewController.swift
//  Student List
//
//  Created by Immanuel Sitepu on 30/11/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField(usernameTextField)
        setupTextField(passwordTextField)
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self

        errorLabel.isHidden = true

    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text,
              !username.isEmpty,
              !password.isEmpty,
              username == "alfagift-admin" && password == "asdf" else {
            errorLabel.text = "Invalid username or password"
            errorLabel.isHidden = false
            return
        }

        errorLabel.isHidden = true

        performSegue(withIdentifier: "toListOfStudents", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func setupTextField(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.black
        
        let placeholderText = textField.placeholder ?? ""
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray,
            ]
            textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 3.5
        textField.layer.masksToBounds = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
}
