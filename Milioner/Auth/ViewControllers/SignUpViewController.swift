//
//  SignUpViewController.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 06.10.24.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet private weak var createAccount:UILabel!
    @IBOutlet private weak var findNewThings:UILabel!
    @IBOutlet private weak var haveAnAccountLabel:UILabel!
    @IBOutlet private weak var signInButton:UIButton!
    @IBOutlet private weak var signUpButton:UIButton!
    @IBOutlet private weak var nameText:UITextField!
    @IBOutlet private weak var surnameText:UITextField!
    @IBOutlet private weak var emailText:UITextField!
    @IBOutlet private weak var passwordText:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    fileprivate func configureUI() {
        configureButton()
        configureTextField()
    }
    fileprivate func configureButton(){
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        signUpButton.setTitle("Sign Up", for: .normal)
        signInButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
        signInButton.setTitle("Login", for: .normal)
        signUpButton.isHidden = true
    }
    fileprivate func configureTextField() {
        nameText.delegate = self
        surnameText.delegate = self
        emailText.delegate = self
        passwordText.delegate = self
        passwordText.isSecureTextEntry = true
        
    }
    @objc fileprivate func signUpButtonClicked(){
        
    }
    @objc fileprivate func signInButtonClicked(){
        navigationController?.popViewController(animated: true)
    }
   
}
extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if let name = nameText.text, name.count > 2 {
            nameText.layer.borderWidth = 1.0
            nameText.layer.borderColor = UIColor.green.cgColor
          
        } else {
            nameText.layer.borderWidth = 1.0
            nameText.layer.borderColor = UIColor.red.cgColor
        }
        
        if let email = emailText.text,emailText.isValidEmail(email) {
            emailText.layer.borderWidth = 1.0
           emailText.layer.borderColor = UIColor.green.cgColor
           
        } else {
            emailText.layer.borderWidth = 1.0
            emailText.layer.borderColor = UIColor.red.cgColor
        }
        
        if let surname = surnameText.text, surname.count > 4 {
            surnameText.layer.borderWidth = 1.0
            surnameText.layer.borderColor = UIColor.green.cgColor
            
        } else {
            surnameText.layer.borderWidth = 1.0
            surnameText.layer.borderColor = UIColor.red.cgColor
        }
        
        if let password = passwordText.text, password.count > 7 {
            passwordText.layer.borderWidth = 1.0
            passwordText.layer.borderColor = UIColor.green.cgColor
           
        } else {
            passwordText.layer.borderWidth = 1.0
            passwordText.layer.borderColor = UIColor.red.cgColor
        }
       
        if emailText.layer.borderColor == UIColor.green.cgColor && surnameText.layer.borderColor == UIColor.green.cgColor && passwordText.layer.borderColor == UIColor.green.cgColor && passwordText.layer.borderColor == UIColor.green.cgColor {
            signUpButton.isHidden = false
        } else {
            signUpButton.isHidden = true
        }

    }
  
   
}
extension UITextField: Validations {
    
}

