//
//  FeedbackViewController.swift
//  Asses Me
//
//  Created by Alfian Akmal on 28/04/21.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var lblFeedback: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    var feedback = Feedback()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnHome.layer.cornerRadius = 10
        
        updateFeedback(challengeName: feedback.challengeName, score: feedback.score)
    }
    
    func updateFeedback(challengeName : String, score : Int)  {
        if challengeName == "NC1" {
            if score >= 0 && score<=19 {
                feedback.feedback = "Take your time, try to do a reflection and remember what your goals!"
            }else if score >= 20 && score <= 39{
                feedback.feedback = "Come on🔥, try to upgrade your critical thinking and communication skills by joining some club and try to give a feedback from social issue"
            }else if score >= 40 && score <= 59{
                feedback.feedback = "Practice makes perfect!! Try to find more platform to learn critical thinking and communication skills"
            }else if score >= 60 && score <= 79{
                feedback.feedback = "Wohoo Keep it up, you can do it better Simbooo!🦁"
            }else if score >= 80 && score <= 100{
                feedback.feedback = "It’s excellent simbo, stay roar!"
            }
        }else if challengeName == "NC2" {
            if score >= 0 && score<=19 {
                feedback.feedback = "Take your time, try to do a reflection and remember what your goals!"
            }else if score >= 20 && score <= 39{
                feedback.feedback = "Come on🔥, try to be more curious in creating an app! design and coding its not hard as you think if you practice more!"
            }else if score >= 40 && score <= 59{
                feedback.feedback = "Yay, you did good simbo, prepare yourself for a design and code journey!"
            }else if score >= 60 && score <= 79{
                feedback.feedback = "Wohoo Keep it up, you can do it better Simbooo!🦁"
            }else if score >= 80 && score <= 100{
                feedback.feedback = "It’s excellent simbo, stay roar!"
            }
        }else if challengeName == "MC1" {
            if score >= 0 && score<=19 {
                feedback.feedback = "Take your time, try to do a reflection and remember what your goals!"
            }else if score >= 20 && score <= 39{
                feedback.feedback = "Come on🔥, try to upgrade your teamwork skills and be more curious in creating an app! Evaluate your performa in NC2"
            }else if score >= 40 && score <= 59{
                feedback.feedback = "Practice makes perfect!! Try to learn more about basic code and design from NC2 !!"
            }else if score >= 60 && score <= 79{
                feedback.feedback = "Wohoo Keep it up, you can do it better Simbooo!🦁"
            }else if score >= 80 && score <= 100{
                feedback.feedback = "It’s excellent simbo, stay roar!"
            }
        }
        
        lblScore.text = "\(String(describing: feedback.score!))%"
        lblFeedback.text = feedback.feedback
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    }
    
    @IBAction func backToHome(_ sender: Any) {
    }
    
}

//extension FeedbackViewController{
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    var items : [namaCoredata]?
//    func fetchData(){
//        do {
//            let request = namaCoredata.fetchRequest() as Nsfetchrequest<namaCoreData>
//            //ambil data di coredata yang memiliki nama : NC1
//            let pred = NSPredicate(format: "nama challenge CONTAINS %@","NC1")
//            request.predicate = pred
//            self.items = try context.fetch(request)
//        } catch  {
//
//        }
//    }
//}
