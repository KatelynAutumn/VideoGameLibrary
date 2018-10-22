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

    
    var currentGame: VideoGame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TableView.reloadData()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditGameViewController {
            //We need to pass through the Game that we'll be editing.
            destination.gameToEdit = currentGame
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.sharedInstance.getGameCount()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoGameCell") as! VideoGameTableViewCell
        
        let gameAtIndex = GameManager.sharedInstance.allGames[indexPath.row]
        cell.TitleLabel.text = gameAtIndex.Title
        cell.GenreLabel.text = gameAtIndex.Genre
        cell.RatingLabel.text = gameAtIndex.Rating
        cell.DueDateLabel.text = ""
        let currentGame = GameManager.sharedInstance.allGames[indexPath.row]
        
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
    
    // This allows us to return an array of actions, that the row will have(if any)
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
          //Remove the game at the current index from our game array
            GameManager.sharedInstance.removeGame(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let gameForIndex = GameManager.sharedInstance.getGame(at: indexPath.row)
        let title = gameForIndex.Availability ? "Check Out" : "Check In"
        
        let checkOutOrInAction = UITableViewRowAction(style: .normal, title: title) { _,_ in
            GameManager.sharedInstance.checkGameInOrOut(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        
        let showEditScreenAction = UITableViewRowAction(style: .normal, title: "Edit") { _, _ in
            self.currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
            self.performSegue(withIdentifier: "showEditGameScreen", sender: self)
        }
        
        let showDescription = UITableViewRowAction(style: .normal, title: "Description") { _, _ in
            self.currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
            self.performSegue(withIdentifier: "showGameDetails", sender: self)
        }
        
        
        showEditScreenAction.backgroundColor = UIColor.black
        
        return [deleteAction, showDescription, showEditScreenAction, checkOutOrInAction]
    }
    
    @IBAction func unwindToVideoGameLibrary(segue: UIStoryboardSegue) { }
    
}
