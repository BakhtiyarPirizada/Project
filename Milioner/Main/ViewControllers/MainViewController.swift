//
//  MainViewController.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 06.10.24.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var startButton:UIButton!
    @IBOutlet private weak var nameTextField:UITextField!
    @IBOutlet var circleView:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    fileprivate func configureUI() {
        imageView.image = .mainControllerBG
        imageView.backgroundColor = UIColor.mainControllerBG
        circleView.layer.cornerRadius = circleView.frame.size.width/2
        nameTextField.delegate = self
        configureButton()
        
    }
    func configureButton() {
        startButton.addTarget(self, action: #selector(showQuestionsViewController), for: .touchUpInside)
        startButton.isEnabled = false
    }
    @objc fileprivate func showQuestionsViewController() {
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController ?? QuestionsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
extension MainViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if nameTextField.text?.isEmpty == false {
            startButton.isEnabled = true
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        UserDefaultsHelper.setString(key: "username", value: nameTextField.text ?? "")
       
    }
}

