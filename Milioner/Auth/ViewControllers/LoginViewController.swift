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
    @objc fileprivate func loginButtonButtonClicked(){
        print(#function)
        
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

}
extension LoginViewController: SignUpDelegate {
    func didFinishSignUp(user: User) {
        emailText.text = user.email
        passwordText.text = user.password
    }
    
    
}


    


