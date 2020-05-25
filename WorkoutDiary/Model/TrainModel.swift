//
//  TrainModel.swift
//  WorkoutDiary
//
//  Created by Igor Aryslanov on 22.05.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import Foundation

class Train: Codable {
    var dateOfTrain: String
    var kindOfTrain: String // KindOfTrain
    var id: String
    
    init(dateOfTrain: String, kindOfTrain: String) {
        self.dateOfTrain = dateOfTrain
        self.kindOfTrain = kindOfTrain
        self.id = UUID().uuidString
    }
}

// MARK: UserDefaults -
extension Train {
    
    static var userDefaultsKey = "TrainsKey"
    
    static func save( _ train: [Train]) {
        let data = try? JSONEncoder().encode(train) // Convert information to bytes.
        UserDefaults.standard.set(data, forKey: Train.userDefaultsKey) // Save information (Singleton).
    }
    
    static func loadTrain() -> [Train] {
        var returnValue: [Train] = []
        
        if let data = UserDefaults.standard.data(forKey: Train.userDefaultsKey),
            let trains = try? JSONDecoder().decode([Train].self, from: data) {
            returnValue = trains
        }
        return returnValue
    }
}

enum KindOfTrain {
    case technical
    case generalPhysicalPreparation
    case сlimbingWall
}
