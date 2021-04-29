//
//  DetailChallengeViewController.swift
//  Asses Me
//
//  Created by Alfian Akmal on 27/04/21.
//

import UIKit

class DetailChallengeViewController: UIViewController {

    @IBOutlet weak var imgChallenge: UIImageView!
    @IBOutlet weak var btnTakeTest: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblProgress: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnTest: UIButton!
    @IBOutlet weak var viewBg: UIView!
    
    @IBOutlet weak var maskView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var commonView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var commonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var commonHeightConstraint: NSLayoutConstraint!
    
    var detail = Challenges()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnTest.layer.cornerRadius = 8
        updateUI()
        
        ChallengeStatic.chosenOne = detail
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func updateUI() {
        imgChallenge.image = UIImage(named: detail.image!)
        lblTitle.text = detail.name
        lblProgress.text = detail.progress
        
        if detail.isTested == false {
            btnTest.setTitle("Take Test!", for: .normal)
            btnTest.backgroundColor = .systemOrange
        }else{
            btnTest.setTitle("\(detail.score)%", for: .normal)
            btnTest.backgroundColor = .systemBlue
        }
    
        lblDesc.attributedText = detail.descrip?.htmlAttributedString2(size: 18, color: .systemGray)
    }
    

    @IBAction func backMenu(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func takeTest(_ sender: Any) {
        if detail.isTested {
            let viewController = storyboard!.instantiateViewController(withIdentifier: "FeedbackView") as! FeedbackViewController;
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            viewController.feedback = Feedback(challengeName:detail.name, score: Int(detail.score), feedback: "")
            self.present(viewController, animated: true, completion: nil)
        } else {
            let viewController = storyboard!.instantiateViewController(withIdentifier: "Questionare") as! QueistionareViewController;
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
}

extension String {
    func htmlAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }

        return try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        )
    }
}

extension String {
    func htmlAttributedString2(size: CGFloat, color: UIColor) -> NSAttributedString? {
        let htmlTemplate = """
        <!doctype html>
        <html>
          <head>
            <style>
              body {
                color: \(color.hexString!);
                font-family: -apple-system;
                font-size: \(size)px;
              }
            </style>
          </head>
          <body>
            \(self)
          </body>
        </html>
        """

        guard let data = htmlTemplate.data(using: .utf8) else {
            return nil
        }

        guard let attributedString = try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
            ) else {
            return nil
        }

        return attributedString
    }
}

extension UIColor {
    var hexString:String? {
        if let components = self.cgColor.components {
            let r = components[0]
            let g = components[1]
            let b = components[2]
            return  String(format: "#%02x%02x%02x", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
        }
        return nil
    }
}
