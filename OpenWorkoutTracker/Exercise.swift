//
//  Exercise.swift
//  OpenWorkoutTracker
//
//  Created by Thomas Lind Nielsen on 15/10/2024.
//

import Foundation
import SwiftData

@Model
class Exercise {
    var reps: Int
    var sets: Int
    var weight: Int
    var name: String
    
    init(reps: Int, sets: Int, weight: Int, name: String) {
        self.reps = reps
        self.sets = sets
        self.weight = weight
        self.name = name
    }
}
