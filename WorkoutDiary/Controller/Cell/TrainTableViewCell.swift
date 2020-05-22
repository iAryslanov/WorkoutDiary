//
//  TrainTableViewCell.swift
//  WorkoutDiary
//
//  Created by Igor Aryslanov on 21.04.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit

class TrainTableViewCell: UITableViewCell {

    @IBOutlet private weak var trainImagesView: UIImageView!
    
    @IBOutlet weak var kindOfTrainTitleLabel: UILabel!
    @IBOutlet weak var dateOfTrainLabel: UILabel!
    
    func configure(_ train: Train) {
        kindOfTrainTitleLabel.text = train.kindOfTrain
        dateOfTrainLabel.text = train.dateOfTrain
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        trainImagesView.contentMode = .scaleAspectFill
        trainImagesView.layer.cornerRadius = 30
    }
}
