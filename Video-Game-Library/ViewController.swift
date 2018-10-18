//
//  ViewController.swift
//  Video-Game-Library
//
//  Created by Katelyn Pace on 10/15/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var TableView: UITableView!
    
    var allGames = [VideoGame(Title: "The Elder Scrolls V: Skyrim", Genre: "Action Role Playing", Rating: "M", Description: "Blah blah blah"), VideoGame(Title: "Fallout 4", Genre: "Post Apolocalyptic Role Playing", Rating: "M", Description: "blah blah blah")]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoGameCell") as! VideoGameTableViewCell
        
        allGames[0].Availability = false
        
        let gameAtIndex = allGames[indexPath.row]
        cell.TitleLabel.text = gameAtIndex.Title
        cell.GenreLabel.text = gameAtIndex.Genre
        cell.RatingLabel.text = gameAtIndex.Rating
        cell.DueDateLabel.text = ""
        let currentGame = allGames[indexPath.row]
        
        //If the current game is checked in, the background color of the status view will be green
        if currentGame.Availability {
            cell.AvailabilityColor.backgroundColor = UIColor.green
        } else {
            cell.AvailabilityColor.backgroundColor = UIColor.red
        }
        
        //If the game has  a due date, we want to format it into a String and display it on the DueDateLabel
        if let dueDate = currentGame.DueDate {
            cell.DueDateLabel.text = formatDate(dueDate)
        } else {
            cell.DueDateLabel.text = ""
        }
        
        
        return cell
    }
    
    @IBAction func unwindToVideoGameLibrary(segue: UIStoryboardSegue) { }
    
}
