//
//  VideoGame.swift
//  Video-Game-Library
//
//  Created by Katelyn Pace on 10/15/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation

class VideoGame {
    let Title: String
    let Genre: String
    let Rating: String
    let Description: String
    var Availability: Bool = true
    var DueDate: Date?
    
    init(Title: String, Genre: String, Rating: String, Description: String) {
        self.Title = Title
        self.Genre = Genre
        self.Rating = Rating
        self.Description = Description
        
        
    }
    
    
    
    
    
    
}



