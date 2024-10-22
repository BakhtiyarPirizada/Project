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
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        configureUI()
        
    }
    fileprivate func configureUI() {
        imageView.image = .mainControllerBG
        imageView.backgroundColor = UIColor.mainControllerBG
    }
    func configureButton() {
        startButton.addTarget(self, action: #selector(showQuestionsViewController), for: .touchUpInside)
    }
    @objc fileprivate func showQuestionsViewController() {
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController ?? QuestionsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

