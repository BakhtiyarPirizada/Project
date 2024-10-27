//
//  LoginViewController.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 06.10.24.
//

import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet private weak var welcomeBackLabel:UILabel!
    @IBOutlet private weak var continueLabel:UILabel!
    @IBOutlet private weak var dontHaveAnAccountLabel:UILabel!
    @IBOutlet private weak var loginButton:UIButton!
    @IBOutlet private weak var signUpButton:UIButton!
    @IBOutlet private weak var emailText:UITextField!
    @IBOutlet private weak var passwordText:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
       
        
    }
    fileprivate func configureButton(){
        loginButton.addTarget(self, action: #selector(loginButtonButtonClicked), for: .touchUpInside)
        loginButton.setTitle("Login", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        signUpButton.setTitle("Sign Up", for: .normal)
        loginButton.isEnabled = false
    }
    fileprivate func configureUI(){
        configureButton()
        configureTextField()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    fileprivate func configureTextField() {
        emailText.delegate = self
        passwordText.delegate = self
        passwordText.isSecureTextEntry = true
    }
    fileprivate func checkValidation(
        password:String,
        email: String
    ) -> Bool {
        let result = emailText.text == UserDefaultsHelper.getString(key: "email") && passwordText.text == UserDefaultsHelper.getString(key: "password")
        return result
    }
   
    @objc fileprivate func loginButtonButtonClicked(){
      // if checkValidation(password: passwordText.text!, email: emailText.text!){
            let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
            scene?.switchToMain()
       //} else {
       //   alert(titleInput: "Error", messageInput: "Useremail or password is wrong!")
       //}
    }
    fileprivate func alert(titleInput: String, messageInput: String){
        let errorAlert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.destructive, handler: nil)
            self.present(errorAlert, animated: true, completion: nil)
        errorAlert.addAction(okButton)
    }
    @objc fileprivate func signUpButtonClicked(){
       showSignUpController()
    }
    fileprivate func  showSignUpController() {
            let vc = UIStoryboard.init(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController")
            as! SignUpViewController
            navigationController?.pushViewController(vc, animated: true)
        vc.delegate = self
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
      guard let email = emailText.text,
            let password = passwordText.text else {return}
      if  checkValidation(password: password,email: email) {
          loginButton.isEnabled = true
      } else {
         // alert(titleInput: "Error", messageInput: "Useremail or password is wrong!")
      }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
extension LoginViewController: SignUpDelegate {
    func didFinishSignUp(user: User) {
        emailText.text = user.email
        passwordText.text = user.password
        loginButton.isEnabled = true
    }
}


    


