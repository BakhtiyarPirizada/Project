//
//  AnswerCollectionViewCell.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 21.10.24.
//

import UIKit

class AnswerCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var answeLabel: UILabel!
    @IBOutlet private weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func configureCell(answer:String) {
        answeLabel.text = answer
    }
}
