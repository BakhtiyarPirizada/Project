//
//  TableViewCell.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 29.10.24.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet private weak var questinLabel:UILabel!
    @IBOutlet private weak var answerLabel:UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureCell(questions:String,answers:String) {
        questinLabel.text = questions
        answerLabel.text = answers
        }

}
