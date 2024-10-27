//
//  AnswerCollectionViewCell.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 21.10.24.
//

import UIKit

class AnswerCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var answeLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    override func prepareForReuse() {
        answeLabel.text = ""
    }
    func configureCell(answer:String) {
        answeLabel.text = answer
    }
}
