//
//  MainViewController.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 06.10.24.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    fileprivate func configureUI() {
        imageView.image = .mainControllerBG
        imageView.backgroundColor = UIColor.mainControllerBG
    }


}

