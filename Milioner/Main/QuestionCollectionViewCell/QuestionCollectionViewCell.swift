//
//  QuestionCollectionViewCell.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 22.10.24.
//

import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var answerCollectionView:UICollectionView!
    @IBOutlet private weak var questionLabel:UILabel!
    @IBOutlet private weak var questionNumberLabel:UILabel!
    @IBOutlet private weak var timeLabel:UILabel!
    var model:Questions?
    var cellColors :[UIColor?] = Array(repeating: nil, count: 4)
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    func configureCell(model:Questions){
        questionLabel.text = model.question
    }
    fileprivate func configureCollectionView() {
        answerCollectionView.delegate = self
        answerCollectionView.dataSource = self
        answerCollectionView.register(UINib(nibName: "AnswerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnswerCollectionViewCell")
    }
    fileprivate func collectionViewReload() {
        DispatchQueue.main.async {
            self.answerCollectionView.reloadData()
        }
    }
    override func prepareForReuse() {
        collectionViewReload()
    }
}
extension QuestionCollectionViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCollectionViewCell", for: indexPath) as? AnswerCollectionViewCell ?? AnswerCollectionViewCell()
        if let model = model {
            cell.configureCell(answer: model.answers[indexPath.row])
        }
        cell.backgroundColor = cellColors[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 4, height: collectionView.frame.height/4 - 4)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model =  model else {return}
        if model.answers[indexPath.row] == model.trueAnswer {
            cellColors[indexPath.item] = .view
            collectionView.reloadItems(at: [indexPath])
        }
    }
}
