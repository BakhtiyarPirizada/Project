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
    private var isTrue = false
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }

    fileprivate func configureUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        configureButton()
        generateQuestions()
        configureCollectionView()
        //collectionViewReload()
    }
    fileprivate func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "QuestionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QuestionCollectionViewCell")
        collectionView.isPagingEnabled = true
       // collectionView.isScrollEnabled = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = layout
        //collectionViewReload()
    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView.collectionViewLayout.invalidateLayout()
//    }
    func configureButton() {
        nextButton.addTarget(self, action: #selector(scrollToNextQuestion), for: .touchUpInside)
        previousButton.addTarget(self, action: #selector(scrollToPreviousQuestion), for: .touchUpInside)
    }
  
    
    fileprivate func generateQuestions() {
        questions = [
            Questions(question: "2+3", answers: ["5","3","6","2"], trueAnswer: "5"),
            Questions(question: "2+5", answers: ["1","2","7","4"], trueAnswer: "7"),
            Questions(question: "1+7", answers: ["3","4","5","8"], trueAnswer: "8"),
            Questions(question: "8+3", answers: ["11","32","3","4"], trueAnswer: "11"),
            Questions(question: "9+3", answers: ["10","3","39","12"], trueAnswer: "12"),
            Questions(question: "10+3", answers: ["15","13","9","1"], trueAnswer: "13"),
            Questions(question: "101+3", answers: ["15","113","19","104"], trueAnswer: "104")
        ]
   
    }
    fileprivate func collectionViewReload() {
        DispatchQueue.main.async{
            self.collectionView.reloadData()
        }
    }
   @objc func scrollToNextQuestion() {
     
           if self.selectedIndex < self.questions.count - 1  {
               self.selectedIndex += 1
               let indexPath = IndexPath(item: self.selectedIndex, section: 0)
               print("Scrolling to indexPath: \(indexPath)")
               print(self.selectedIndex)
               self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
               collectionViewReload()
           } else {
               print("Scrolling is not possible. Index is out of bounds.")
           }
         }
       
    @objc func scrollToPreviousQuestion() {
        print(#function)
//        collectionViewReload()
//        if selectedIndex > 0 {
//            selectedIndex -= 1
//           let indexPath = IndexPath(item: selectedIndex, section: 0)
//                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//        }
       
        }
}
extension QuestionsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionViewCell", for: indexPath) as? QuestionCollectionViewCell ?? QuestionCollectionViewCell()
        cell.configureCell(model: questions[indexPath.row])
        selectedIndex = indexPath.row
        cell.model = questions[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    
}
