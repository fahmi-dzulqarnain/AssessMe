//
//  MainPageViewController.swift
//  Asses Me
//
//  Created by Alfian Akmal on 27/04/21.
//

import UIKit

class MainPageViewController: UIViewController{

    @IBOutlet weak var challengeCV: UICollectionView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var arrChallenge = [Challenges]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        challengeCV.dataSource = self
        challengeCV.delegate = self
        
        arrChallenge = getAllItems()
        
        do {
            if try context.fetch(Challenges.fetchRequest()).count == 0 {
                addData()
            }
        } catch {}
        
        challengeCV.reloadData()
    }
    
    func addData() {
        createChallenge(challenge: Challenge(image: "NC1", name: "NC1", progress: "Done", isTested: false, score: 0, description: """
            <p><b>&#128049; What will you learn?</b></p>
            <p>to solve the challenge you need to understand the framework that can help you solving it. on NC1 you will learn Challenge Based Learning (CBL).v</p>
                            
            <p><b>&#128047; What is the final deliverable?</b></p>
            <p>Synthesis.</p>
            """))
        createChallenge(challenge: Challenge(image: "NC2", name: "NC2", progress: "Done", isTested: false, score: 0, description: """
            <p><b>&#128640; GOAL</b></p>
            <p>Nano Challenge 2's goal is to enable learners to hone individual skill in technical and design domain.</p>

            <p><b>&#128368; TIMELINE</b></p>
            <p>29 march 2021 - 12 April 2021</p>

            <p><b>&#128241; OUTCOME</b></p>
            <p>The outcome is an individually-developed app.</p>

            <p><b>&#127958; SANDBOX</b></p>
            <p>A single page app</p>
            """))
        createChallenge(challenge: Challenge(image: "MC1", name: "MC1", progress: "On Progress", isTested: false, score: 0, description: """
            <p><b>&#128640; GOAL</b></p>
            <p>MC1-Applied's goal is to enable learners to apply the technical skills they have learned in previous challenge in order to implement their solution concept into an app</p>

            <p><b>&#128368; TIMELINE</b></p>
            <p>16 - 30 April 2021</p>

            <p><b>&#128241; OUTCOME</b></p>
            <p>Implementation of MC1's solution concept in the form of an iOS app.</p>

            <p><b>&#127958; SANDBOX</b></p>
            <p>Sandbox is a limitation of your app</p>
            <ol>
            <li>Fully implementing iOS native UI elements (no customization)</li>
            <li>Implementing color contrast and typography</li>
            <li>No third party API</li>
            <li>Focus in only 1 main feature</li>
            <li>Avoid solution in the form of creating e-commerce, social media, or media player</li>
            <li>No need to create login, registration, or profile page</li>
            </ol>
            """))
        
        arrChallenge = getAllItems()
    }
    
    // Core Data
    
    func getAllItems() -> [Challenges]{
        do {
            return try context.fetch(Challenges.fetchRequest())
        }
        catch {
            return [Challenges]()
        }
    }
    
    func createChallenge(challenge: Challenge){
        let newItem = Challenges(context: context)
        newItem.name = challenge.name
        newItem.image = challenge.image
        newItem.isTested = challenge.isTested
        newItem.progress = challenge.progress
        newItem.score = Int16(challenge.score)
        newItem.descrip = challenge.description
        
        do {
            try context.save()
        } catch let error {
            print("Failure to save context: \(error)")
        }
    }
}

extension MainPageViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrChallenge.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChallengeCell", for: indexPath) as! ChallengeCollectionViewCell
        
        cell.challenge = self.arrChallenge[indexPath.row]
        cell.updateUI()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailChallengeView") as! DetailChallengeViewController;
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        viewController.detail = arrChallenge[indexPath.row]
        self.present(viewController, animated: true, completion: nil)
    }
}
