//
//  ChallengeCollectionViewCell.swift
//  Asses Me
//
//  Created by Alfian Akmal on 27/04/21.
//

import UIKit

class ChallengeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellProgress: UILabel!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellScore: UILabel!
    
    var challenge : Challenges!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI() {
        cellImage.image = UIImage(named: challenge.image!)
        cellTitle.text = challenge.name
        cellProgress.text = challenge.progress
        
        if challenge.isTested == false {
            cellScore.text = "Take Test!"
            cellScore.backgroundColor = .systemOrange
        }else{
            cellScore.text = "\(challenge.score)%"
            cellScore.backgroundColor = .systemBlue
        }
    }

}
