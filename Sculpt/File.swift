//
//  File.swift
//  Sculpt
//
//  Created by Abhishek Dubey on 13/09/20.
//  Copyright © 2020 Dev Abhi. All rights reserved.
//

import Foundation

class workoutInfo{
    internal init(name: String, difficulty: String, duration: String, imageNames: String, workoutImages: String, equipmentURL: String, videoId: String, description: String, filters: String) {
        self.name = name
        self.difficulty = difficulty
        self.duration = duration
        self.imageNames = imageNames
        self.workoutImages = workoutImages
        self.equipmentURL = equipmentURL
        self.videoId = videoId
        self.description = description
        self.filters = filters
    }
    
    
    var name: String
    var difficulty: String
    var duration: String
    var imageNames: String
    var workoutImages: String
    var equipmentURL: String
    var videoId: String
    var description: String
    var filters: String
    
    
    
}
