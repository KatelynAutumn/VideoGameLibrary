//
//  GameManager.swift
//  Video-Game-Library
//
//  Created by Katelyn Pace on 10/18/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation


class GameManager {
    //Shared instance of the GameManager class
    static let sharedInstance = GameManager()
    
    
    //The array of games that will be used throughout the application
   var allGames = [VideoGame(Title: "The Elder Scrolls V: Skyrim", Genre: "Action Role Playing", Rating: "M", Description: "Blah blah blah"), VideoGame(Title: "Fallout 4", Genre: "Post Apolocalyptic Role Playing", Rating: "M", Description: "blah blah blah")]
    
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
        allGames.append(game)
    }
    
    func removeGame(at index: Int) {
        allGames.remove(at: index)
    }
    
    func checkGameInOrOut(at index: Int) {
        let gameForIndex = allGames[index]
        allGames[index].Availability = !allGames[index].Availability
        
        if gameForIndex.Availability {
            //removes any existing due date
            gameForIndex.DueDate = nil
        } else {
            //add a new due date, since the game is being checked out
            gameForIndex.DueDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())
        }
    }

}
