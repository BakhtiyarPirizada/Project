//
//  GetStartedViewController.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 06.10.24.
//

import UIKit

final class GetStartedViewController: UIViewController {
      @IBOutlet private weak var welcomeLabel:UILabel!
      @IBOutlet private weak var designTutorial:UILabel!
      @IBOutlet private weak var descriptionLabel:UILabel!
      @IBOutlet private weak var getStartedButton:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()

    }
    fileprivate func configureButton(){
        getStartedButton.addTarget(self, action: #selector(getStartedButtonClicked), for: .touchUpInside)
    }
    @objc fileprivate func getStartedButtonClicked(){
        let vc = UIStoryboard.init(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
        as? LoginViewController ?? LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }


}
