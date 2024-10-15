//
//  Item.swift
//  OpenWorkoutTracker
//
//  Created by Thomas Lind Nielsen on 15/10/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
