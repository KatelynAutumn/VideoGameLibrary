//
//  Utilities.swift
//  Video-Game-Library
//
//  Created by Katelyn Pace on 10/18/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation

func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, yyyy"
    
    let formattedString = formatter.string(from: date)
    return formattedString
}
