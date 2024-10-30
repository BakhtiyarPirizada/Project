//
//  ResultsControllerView.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 29.10.24.
//

import UIKit

class ResultsControllerView: UIViewController {
    @IBOutlet private weak var tableView:UITableView!
    @IBOutlet private weak var resultLabel:UILabel!
    @IBOutlet private weak var userLabel:UILabel!
    @IBOutlet private weak var againButton:UIButton!
    var questions : [String]=[]
    var answers : [String]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
       
      
}
    fileprivate func configureUI() {
        configureTableView()
        configureButton()
        resultLabel.text = String(questions.count)
        userLabel.text = UserDefaultsHelper.getString(key: "username")
        
    }
    fileprivate func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.rowHeight = 50
    }
    func configureButton() {
        againButton.addTarget(self, action: #selector(showMain), for: .touchUpInside)
    }
    @objc fileprivate func showMain() {
        let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        scene?.switchToMain()
        UserDefaultsHelper.setString(key: "username", value: "")
    }

}
extension ResultsControllerView: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.configureCell(questions: questions[indexPath.row], answers: answers[indexPath.row])
        return cell
    }
    
    
    
}
