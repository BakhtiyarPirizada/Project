//
//  QuestionsViewController.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 21.10.24.
//

import UIKit

class QuestionsViewController: UIViewController {
    @IBOutlet private var collectionView:UICollectionView!

    fileprivate var questions:[Questions] = []
    private var isTrue = false
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        generateQuestions()
    }
  
    fileprivate func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "QuestionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QuestionCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.sectionInset = .zero
        collectionView.isPagingEnabled = true
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViewReload()
    }
    
    fileprivate func generateQuestions() {
        questions = [
            Questions(question: "2+3", answers: ["5","3","6","2"], trueAnswer: "5"),
            Questions(question: "2+5", answers: ["1","2","7","4"], trueAnswer: "7"),
            Questions(question: "1+7", answers: ["3","4","5","8"], trueAnswer: "8"),
            Questions(question: "8+3", answers: ["11","32","3","4"], trueAnswer: "11"),
            Questions(question: "9+3", answers: ["10","3","39","12"], trueAnswer: "12")
        ]
        collectionViewReload()
    }
    fileprivate func collectionViewReload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
extension QuestionsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionViewCell", for: indexPath) as? QuestionCollectionViewCell ?? QuestionCollectionViewCell()
        cell.model = questions[indexPath.row]
        cell.configureCell(model: questions[indexPath.row])
        selectedIndex = indexPath.row
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
