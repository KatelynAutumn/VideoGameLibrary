//
//  VideoGame.swift
//  Video-Game-Library
//
//  Created by Katelyn Pace on 10/15/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit
import RealmSwift

class VideoGame: Object {
    @objc dynamic var Title: String = ""
    @objc dynamic var Genre: String = ""
    @objc dynamic var Rating: String = ""
    @objc dynamic var Description: String = ""
    @objc dynamic var Availability: Bool = true
    @objc dynamic var DueDate: Date? = nil
        
        
    }



