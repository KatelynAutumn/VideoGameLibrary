//
//  GameManager.swift
//  Video-Game-Library
//
//  Created by Katelyn Pace on 10/18/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation
import UserNotifications
import RealmSwift

class GameManager {
    //Shared instance of the GameManager class
    static let sharedInstance = GameManager()
    
    
    private init() {
        allGames = realm.objects(VideoGame.self)
    }
    
    //Results Container for storing our Games. This functions very similarly to an array or dictionary
    private var allGames: Results<VideoGame>!
    
    let realm = try! Realm()
    
    //Function to get the number of games we have
    func getGameCount() -> Int {
        return allGames.count
    }
    
    //Function to return a game at a specific index
    func getGame(at index: Int) -> VideoGame {
        return allGames[index]
    }
    
    //Function to add a game to the game library
    func addGame(game: VideoGame) {
        try! realm.write {
            realm.add(game)
        }
    }
    
    func removeGame(at index: Int) {
        try! realm.write {
            realm.delete(getGame(at: index))
        }
    }
    
    func checkGameInOrOut(at index: Int) {
        let gameForIndex = allGames[index]

        try! realm.write {
            gameForIndex.Availability = !gameForIndex.Availability
            
        if gameForIndex.Availability {
            //removes any existing due date
            gameForIndex.DueDate = nil
        } else {
            //add a new due date, since the game is being checked out
            gameForIndex.DueDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())
            let center = UNUserNotificationCenter.current()
            
            let content = UNMutableNotificationContent()
            content.title = gameForIndex.Title
            content.body = "Your Game Is Due!"
            
            let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(5))
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
            
            let identifier = gameForIndex.Title
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
            
            center.add(request, withCompletionHandler: { error in
                if let error = error {
                    print(error.localizedDescription)
                }
            })
        }
    }
    }
}


//gameForIndex.DueDate! use this to set notification to due date
