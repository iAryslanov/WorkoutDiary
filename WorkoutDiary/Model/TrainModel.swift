//
//  TrainModel.swift
//  WorkoutDiary
//
//  Created by Igor Aryslanov on 22.05.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import Foundation

class Train {
    var dateOfTrain: String
    var kindOfTrain: String //KindOfTrain
    var id: String
    
    init(dateOfTrain: String, kindOfTrain: String) {
        self.dateOfTrain = dateOfTrain
        self.kindOfTrain = kindOfTrain
        self.id = UUID().uuidString
    }
}

enum KindOfTrain {
    case technical
    case generalPhysicalPreparation
    case сlimbingWall
}
