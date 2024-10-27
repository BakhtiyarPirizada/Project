//
//  SignUpViewController.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 06.10.24.
//
protocol SignUpDelegate: AnyObject {
    func didFinishSignUp(user:User)
}
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
    weak var delegate:SignUpDelegate?
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
        let user = User(name: nameText.text!, surname: surnameText.text!, email: emailText.text!, password: passwordText.text!)
        delegate?.didFinishSignUp(user: user)
        navigationController?.popViewController(animated: true)
    }
    @objc fileprivate func signInButtonClicked(){
        navigationController?.popViewController(animated: true)
    }
   
    fileprivate func checkValidation(
        name: String,
        surname: String,
        password:String,
        email: String
    ) -> Bool {
        let result = name.count < 3 || !email.isValidEmail() || surname.count < 5 || password.count < 8
        return result
    }
   
}
extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let name = nameText.text,
              let surname = surnameText.text,
              let email = emailText.text,
              let password = passwordText.text else {return}
                
        signUpButton.isHidden = checkValidation(
            name: name,
            surname: surname,
            password: password,
            email: email
        )
        if checkValidation(name: name, surname: surname, password: password, email: email) {
            UserDefaultsHelper.setString(key: "name", value: name)
            UserDefaultsHelper.setString(key: "surname", value: surname)
            UserDefaultsHelper.setString(key: "password", value: password)
            UserDefaultsHelper.setString(key: "email", value: email)
        }
    }
}

