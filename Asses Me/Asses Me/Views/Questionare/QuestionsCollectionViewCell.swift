//
//  QuestionsCollectionViewCell.swift
//  Asses Me
//
//  Created by Fahmi Dzulqarnain on 28/04/21.
//

import UIKit

class QuestionsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var question_1: UILabel!
    @IBOutlet weak var answer_1_1: UIImageView!
    @IBOutlet weak var answer_1_2: UIImageView!
    @IBOutlet weak var answer_1_3: UIImageView!
    @IBOutlet weak var answer_1_4: UIImageView!
    @IBOutlet weak var answer_1_5: UIImageView!
    
    @IBOutlet weak var question_2: UILabel!
    @IBOutlet weak var answer_2_1: UIImageView!
    @IBOutlet weak var answer_2_2: UIImageView!
    @IBOutlet weak var answer_2_3: UIImageView!
    @IBOutlet weak var answer_2_4: UIImageView!
    @IBOutlet weak var answer_2_5: UIImageView!
    
    @IBOutlet weak var question_3: UILabel!
    @IBOutlet weak var answer_3_1: UIImageView!
    @IBOutlet weak var answer_3_2: UIImageView!
    @IBOutlet weak var answer_3_3: UIImageView!
    @IBOutlet weak var answer_3_4: UIImageView!
    @IBOutlet weak var answer_3_5: UIImageView!
    
    var index = 0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            print(index)
           if touch.view == answer_1_1 {
                answer_1_1.isHighlighted = true
                answer_1_2.isHighlighted = false
                answer_1_3.isHighlighted = false
                answer_1_4.isHighlighted = false
                answer_1_5.isHighlighted = false
                Answer.answers[index][0] = 1
           } else if touch.view == answer_1_2 {
                answer_1_1.isHighlighted = false
                answer_1_2.isHighlighted = true
                answer_1_3.isHighlighted = false
                answer_1_4.isHighlighted = false
                answer_1_5.isHighlighted = false
                Answer.answers[index][0] = 2
           } else if touch.view == answer_1_3 {
                answer_1_1.isHighlighted = false
                answer_1_2.isHighlighted = false
                answer_1_3.isHighlighted = true
                answer_1_4.isHighlighted = false
                answer_1_5.isHighlighted = false
                Answer.answers[index][0] = 3
           } else if touch.view == answer_1_4 {
                answer_1_1.isHighlighted = false
                answer_1_2.isHighlighted = false
                answer_1_3.isHighlighted = false
                answer_1_4.isHighlighted = true
                answer_1_5.isHighlighted = false
                Answer.answers[index][0] = 4
           } else if touch.view == answer_1_5 {
                answer_1_1.isHighlighted = false
                answer_1_2.isHighlighted = false
                answer_1_3.isHighlighted = false
                answer_1_4.isHighlighted = false
                answer_1_5.isHighlighted = true
                Answer.answers[index][0] = 5
           } else if touch.view == answer_2_1 {
                answer_2_1.isHighlighted = true
                answer_2_2.isHighlighted = false
                answer_2_3.isHighlighted = false
                answer_2_4.isHighlighted = false
                answer_2_5.isHighlighted = false
                Answer.answers[index][1] = 1
           } else if touch.view == answer_2_2 {
                answer_2_1.isHighlighted = false
                answer_2_2.isHighlighted = true
                answer_2_3.isHighlighted = false
                answer_2_4.isHighlighted = false
                answer_2_5.isHighlighted = false
                Answer.answers[index][1] = 2
           } else if touch.view == answer_2_3 {
                answer_2_1.isHighlighted = false
                answer_2_2.isHighlighted = false
                answer_2_3.isHighlighted = true
                answer_2_4.isHighlighted = false
                answer_2_5.isHighlighted = false
                Answer.answers[index][1] = 3
           } else if touch.view == answer_2_4 {
                answer_2_1.isHighlighted = false
                answer_2_2.isHighlighted = false
                answer_2_3.isHighlighted = false
                answer_2_4.isHighlighted = true
                answer_2_5.isHighlighted = false
                Answer.answers[index][1] = 4
           } else if touch.view == answer_2_5 {
                answer_2_1.isHighlighted = false
                answer_2_2.isHighlighted = false
                answer_2_3.isHighlighted = false
                answer_2_4.isHighlighted = false
                answer_2_5.isHighlighted = true
                Answer.answers[index][1] = 5
           } else if touch.view == answer_3_1 {
                answer_3_1.isHighlighted = true
                answer_3_2.isHighlighted = false
                answer_3_3.isHighlighted = false
                answer_3_4.isHighlighted = false
                answer_3_5.isHighlighted = false
                Answer.answers[index][2] = 1
           } else if touch.view == answer_3_2 {
                answer_3_1.isHighlighted = false
                answer_3_2.isHighlighted = true
                answer_3_3.isHighlighted = false
                answer_3_4.isHighlighted = false
                answer_3_5.isHighlighted = false
                Answer.answers[index][2] = 2
           } else if touch.view == answer_3_3 {
                answer_3_1.isHighlighted = false
                answer_3_2.isHighlighted = false
                answer_3_3.isHighlighted = true
                answer_3_4.isHighlighted = false
                answer_3_5.isHighlighted = false
                Answer.answers[index][2] = 3
           } else if touch.view == answer_3_4 {
                answer_3_1.isHighlighted = false
                answer_3_2.isHighlighted = false
                answer_3_3.isHighlighted = false
                answer_3_4.isHighlighted = true
                answer_3_5.isHighlighted = false
                Answer.answers[index][2] = 4
           } else if touch.view == answer_3_5 {
                answer_3_1.isHighlighted = false
                answer_3_2.isHighlighted = false
                answer_3_3.isHighlighted = false
                answer_3_4.isHighlighted = false
                answer_3_5.isHighlighted = true
                Answer.answers[index][2] = 5
           }
        } 
    }
    
    func setup(_ qs1: Questions, _ qs2: Questions, _ qs3: Questions, index: Int) {
        question_1.text = qs1.question
        question_2.text = qs2.question
        question_3.text = qs3.question
        self.index = index
    }
}
