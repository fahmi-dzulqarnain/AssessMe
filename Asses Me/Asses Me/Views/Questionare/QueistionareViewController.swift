//
//  QueistionareViewController.swift
//  Asses Me
//
//  Created by Fahmi Dzulqarnain on 28/04/21.
//

import UIKit

class QueistionareViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var indexPaths: IndexPath!

    var questions = [[Questions]]()
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == questions.count - 1 {
                btnNext.setTitle("Finish", for: .normal)
            } else {
                btnNext.setTitle("Next", for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isScrollEnabled = false
        questions = getAllItems()
        
        do {
            if try context.fetch(Questions.fetchRequest()).count == 0 {
                let questionAttrs = [
                    Question_(id_challenge: 1, category: "magnitude", question: "I usually respond to a topic / problem by thinking critically"),
                    Question_(id_challenge: 1, category: "magnitude", question: "I can adapt dynamically and quickly learn new things"),
                    Question_(id_challenge: 1, category: "magnitude", question: "I always took the initiative to look for references when there were obstacles I faced in the learning process"),
                    
                    Question_(id_challenge: 1, category: "generality", question: "I am able to have a discussion with a teammate"),
                    Question_(id_challenge: 1, category: "generality", question: "I am able to see problems from various points of view"),
                    Question_(id_challenge: 1, category: "generality", question: "I can recognize my ability to be able to contribute well to the team"),
                    
                    Question_(id_challenge: 1, category: "strength", question: "I am confident that I can manage time and complete my challenges on time"),
                    Question_(id_challenge: 1, category: "strength", question: "I am sure that I have the potential to be able to complete the challenge well with the team"),
                    Question_(id_challenge: 1, category: "strength", question: "I am sure I can build a good teamwork to find a solution that fits the challenge given")
                ]
                
                for question in questionAttrs {
                    createQuestion(question: question)
                }
                questions = getAllItems()
            }
        } catch {}
        
        pageControl.numberOfPages = questions.count
    }

    @IBAction func btnNext_Click(_ sender: Any) {
        if currentPage == questions.count - 1 {
            
            let score = Answer.answers[0].reduce(0, +) + Answer.answers[1].reduce(0, +) + Answer.answers[2].reduce(0, +)
            let finalScore: Double = (Double(score) / 45.0) * 100.0

            print(finalScore)
            print(score)
            Answer.answers.removeAll()
            updateChallenge(challenge: ChallengeStatic.chosenOne, score: Int(finalScore))
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            
            let viewController = storyboard.instantiateViewController(withIdentifier: "FeedbackView") as! FeedbackViewController;
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            viewController.feedback = Feedback(challengeName: "MC1", score: Int(finalScore), feedback: "")
            self.present(viewController, animated: true, completion: nil)
        } else {
            currentPage += 1
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: IndexPath(item: currentPage, section: 0), at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
        }
    }
    
    @IBAction func btnPrev_Click(_ sender: Any) {
        currentPage -= 1
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: IndexPath(item: currentPage, section: 0), at: .centeredHorizontally, animated: true)
        collectionView.isPagingEnabled = true
    }
    
    // Core Data
    
    func getAllItems() -> [[Questions]]{
        do {
            var data = [[Questions]]()
            let mg = try context.fetch(Questions.fetchRequestMagnitude(1))
            let gn = try context.fetch(Questions.fetchRequestGenerality(1))
            let st = try context.fetch(Questions.fetchRequestStrength(1))
            
            data.append(mg)
            data.append(gn)
            data.append(st)
            
            return data
        }
        catch {
            return [[Questions]]()
        }
    }
    
    func createQuestion(question: Question_){
        let newItem = Questions(context: context)
        newItem.id_challenge = Int16(question.id_challenge)
        newItem.question = question.question
        newItem.category = question.category
        
        do {
            try context.save()
        } catch let error {
            print("Failure to save context: \(error)")
        }
    }
    
    func updateChallenge(challenge: Challenges, score: Int){
        challenge.isTested = true
        challenge.score = Int16(score)
        
        do {
            try context.save()
        } catch let error {
            print("Failure to save context: \(error)")
        }
    }
    
    func deleteQuestion(question: Questions){
        context.delete(question)
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    func updateQuestion(question: Questions, new: Questions){
        question.category = new.category
        question.question = new.question
        question.id_challenge = new.id_challenge
        
        do { try context.save() }
        catch { }
    }
}

extension QueistionareViewController: UICollectionViewDelegate {

}

extension QueistionareViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! QuestionsCollectionViewCell
        
        let question = questions[indexPath.row]
        cell.setup(question[0], question[1], question[2], index: indexPath.row)
        indexPaths = indexPath
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

extension QueistionareViewController: UICollectionViewDelegateFlowLayout {

}
