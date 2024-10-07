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
        configureButton()
       
    }
    fileprivate func configureButton(){
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
         signUpButton.setTitle("Sign Up", for: .normal)
        signInButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
        signInButton.setTitle("Login", for: .normal)
    }
    @objc fileprivate func signUpButtonClicked(){
       
    }
    @objc fileprivate func signInButtonClicked(){
        showLoginViewController()
    }
     fileprivate func showLoginViewController(){
        let vc = UIStoryboard.init(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
        as? LoginViewController ?? LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
   

}
