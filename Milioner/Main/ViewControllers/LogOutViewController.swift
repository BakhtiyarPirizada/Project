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
        configureButton()
    }
    
    func configureButton() {
        logOut.addTarget(self, action: #selector(showRegister), for: .touchUpInside)
    }
    @objc fileprivate func showRegister() {
        let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        scene?.switchToRegister()
    }

}
