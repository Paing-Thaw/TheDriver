//
//  RegisterViewController.swift
//  TheDriver
//
//  Created by Eureka Tatsu on 1/5/22.
//
import UIKit
import Foundation
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet weak var gmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = gmailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) {
                authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: "RegisterToMainMenu", sender: self)
                }
            }
        }
        
    }
}
