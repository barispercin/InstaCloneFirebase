//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Barış Perçin on 26.07.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerButtonClicked(_ sender: Any) {
        
        if emailTextField.text != nil {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { data, error in
                 
                if error != nil {
                    self.alertMessage(titleInput: "Error", messageInput: "Email-Password?")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        if emailTextField.text != nil && passwordTextField.text != nil {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { data, error in
                 
                if error != nil {
                    self.alertMessage(titleInput: "Error", messageInput: "Email-Password?")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        
    }
    
    
    func alertMessage(titleInput: String, messageInput: String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

