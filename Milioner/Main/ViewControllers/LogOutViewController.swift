//
//  LogOutViewController.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 18.10.24.
//

import UIKit

class LogOutViewController: UIViewController {
    @IBOutlet private weak var logOut:UIButton!
    @IBOutlet private weak var nameLabel:UILabel!
    @IBOutlet private weak var surnameLabel:UILabel!
    @IBOutlet private weak var emailLabel:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    fileprivate func configureUI() {
        configureButton()
        configureLabels()
    }
    fileprivate func configureLabels() {
        nameLabel.text = UserDefaultsHelper.getString(key: "name")
        surnameLabel.text = UserDefaultsHelper.getString(key: "surname")
        emailLabel.text = UserDefaultsHelper.getString(key: "email")
    }
    fileprivate func configureButton() {
        logOut.addTarget(self, action: #selector(showRegister), for: .touchUpInside)
    }
    @objc fileprivate func showRegister() {
        let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        scene?.switchToRegister()
        UserDefaultsHelper.setString(key: "name", value: "")
        UserDefaultsHelper.setString(key: "surname", value: "")
        UserDefaultsHelper.setString(key: "password", value: "")
        UserDefaultsHelper.setString(key: "email", value: "")
    }

}
