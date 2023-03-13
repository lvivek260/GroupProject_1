//
//  ViewController.swift
//  MultipleApiFetch
//
//  Created by Admin on 09/03/23.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var password = "bitcode"
    var email = "bitcode@gmail.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginButtonClick(_ sender: UIButton) {
        if(passwordTextField.text!.isEmpty || emailTextField.text!.isEmpty){
            if(passwordTextField.text!.isEmpty && emailTextField.text!.isEmpty){
                passwordTextField.attributedPlaceholder = NSAttributedString(
                    string: "Please enter password",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
                )
                emailTextField.attributedPlaceholder = NSAttributedString(
                    string: "Please enter email",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
                )
            }
            else if(passwordTextField.text!.isEmpty){
                passwordTextField.attributedPlaceholder = NSAttributedString(
                    string: "Please enter password",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
                )
            }
            else{
                emailTextField.attributedPlaceholder = NSAttributedString(
                    string: "Please enter email",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
                )
            }
        }
        else{
            if(password == passwordTextField.text && email == emailTextField.text){
                self.performSegue(withIdentifier: "mainViewController", sender: nil)
                
            }
            else{
                emailTextField.textColor = .black
                passwordTextField.textColor = .black
                if(password == passwordTextField.text){
                    emailTextField.textColor = .red
                }
                else if(email == emailTextField.text){
                    passwordTextField.textColor = .red
                }
                else{
                    emailTextField.textColor = .red
                    passwordTextField.textColor = .red
                }
            }
        }
    }
    
    @IBAction func createAccountButtonClick(_ sender: UIButton) {
    }
    
    @IBAction func emailTextFieldAction(_ sender: Any) {
        emailTextField.textColor = .black
    }
    @IBAction func passwordTextFieldAction(_ sender: Any) {
        passwordTextField.textColor = .black
    }
    
}


