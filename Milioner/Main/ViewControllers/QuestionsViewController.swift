//
//  QuestionsViewController.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 21.10.24.
//

import UIKit

class QuestionsViewController: UIViewController {
    @IBOutlet private var collectionView:UICollectionView!
    @IBOutlet private weak var previousButton:UIButton!
    @IBOutlet private weak var nextButton:UIButton!

    fileprivate var questions:[Questions] = []
    fileprivate var userDefaultAnswers : [String:String] = [:]
    fileprivate var isTrue = false
    fileprivate var selectedIndex = 0
    fileprivate var currentQuestion = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        generateQuestions()
        configureUI()
    }
    fileprivate func configureUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        configureButton()
        configureCollectionView()
    }
    fileprivate func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "QuestionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QuestionCollectionViewCell")
        collectionView.isScrollEnabled = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = layout
    }
    func configureButton() {
        nextButton.addTarget(self, action: #selector(scrollToNextQuestion), for: .touchUpInside)
        previousButton.addTarget(self, action: #selector(scrollToPreviousQuestion), for: .touchUpInside)
    }
    fileprivate func generateQuestions() {
        questions = [
            Questions(question: "2+3", answers: [Answer(answer: "5", bool: true),Answer(answer: "6", bool: false),Answer(answer: "7", bool: false),Answer(answer: "8", bool: false),]),
            Questions(question: "2+4", answers: [Answer(answer: "5", bool: false),Answer(answer: "6", bool: true),Answer(answer: "7", bool: false),Answer(answer: "8", bool: false),]),
            Questions(question: "2+5", answers: [Answer(answer: "5", bool: false),Answer(answer: "6", bool: false),Answer(answer: "7", bool: true),Answer(answer: "8", bool: false),]),
            Questions(question: "2+6", answers: [Answer(answer: "15", bool: false),Answer(answer: "6", bool: false),Answer(answer: "7", bool: false),Answer(answer: "8", bool: true),]),
            Questions(question: "3+3", answers: [Answer(answer: "25", bool: false),Answer(answer: "6", bool: true),Answer(answer: "7", bool: false),Answer(answer: "8", bool: false),]),
            Questions(question: "4+3", answers: [Answer(answer: "35", bool: false),Answer(answer: "6", bool: false),Answer(answer: "7", bool: true),Answer(answer: "8", bool: false),]),
        ]
        collectionViewReload()
    }
    fileprivate func collectionViewReload() {
        DispatchQueue.main.async{
            self.collectionView.reloadData()
        }
    }
    @objc func scrollToNextQuestion() {
        if self.currentQuestion < self.questions.count - 1  {
            self.currentQuestion += 1
            let indexPath = IndexPath(item: self.currentQuestion, section: 0)
            print("Scrolling to indexPath: \(indexPath)")
            print(self.currentQuestion)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionViewReload()
        } else {
            print("Scrolling is not possible. Index is out of bounds.")
    }
        print(userDefaultAnswers)
}
    @objc func scrollToPreviousQuestion() {
//        if self.currentQuestion > 0  {
//            self.currentQuestion -= 1
//            let indexPath = IndexPath(item: self.currentQuestion, section: 0)
//            print("Scrolling to indexPath: \(indexPath)")
//            print(self.currentQuestion)
//            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//            collectionViewReload()
//        } else {
//            print("Scrolling is not possible. Index is out of bounds.")
//        }
        print(#function)
    }
    fileprivate func trueAnswers(answer:Answer) {
        if selectedIndex > 0 {
            selectedIndex -= 1
            userDefaultAnswers[questions[selectedIndex].question] = answer.answer

        } else {
           userDefaultAnswers[questions[selectedIndex].question] = answer.answer
        }
    }
}
extension QuestionsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionViewCell", for: indexPath) as? QuestionCollectionViewCell ?? QuestionCollectionViewCell()
        cell.configureCell(model: questions[indexPath.row],num: currentQuestion)
        selectedIndex = indexPath.row
        cell.model = questions[indexPath.row]
        cell.callback = { [weak self] answer in
            self?.trueAnswers(answer: answer)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    
}
