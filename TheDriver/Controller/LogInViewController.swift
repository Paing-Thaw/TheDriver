//
//  LogInViewController.swift
//  TheDriver
//
//  Created by Eureka Tatsu on 1/5/22.
//

import UIKit
import Foundation
import Firebase

class LogInViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: "LogInToMainMenu", sender: self)
                }
            }
        }
    }
    
}
