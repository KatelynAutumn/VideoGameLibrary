//
//  AddGameViewController.swift
//  Video-Game-Library
//
//  Created by Katelyn Pace on 10/16/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var TitleInput: UITextField!
    
    @IBOutlet weak var RatingPicker: UIPickerView!

    @IBOutlet weak var GenreInput: UITextField!
    
    @IBOutlet weak var SubmitButton: UIButton!
    
    @IBOutlet weak var DescriptionInput: UITextView!
    
    //creating a rating array to use in the picker
    let rating = ["E", "E 10+", "T", "M", "A"]
    
    var newGame = VideoGame()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        // Do any additional setup after loading the view.
    }

    //this alert will notify the user if they try to submit a game and any fields aren't filled out
    func showErrorAlert() {
        let errorAlert = UIAlertController(title: "Error", message: "Please fill out all fields before submitting your video game.", preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Close", style: .default){
            _ in
            self.TitleInput.text = ""
            self.GenreInput.text = ""
            self.DescriptionInput.text = ""
        }
        errorAlert.addAction(dismissAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            GameManager.sharedInstance.addGame(game: newGame)
            destination.TableView.reloadData()
        }
    }
    
    //picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rating.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rating[row]
    }

    //this button will set all the users input to the correct var
    @IBAction func SubmitNewGame(_ sender: Any) {
        let selectedRating = rating[RatingPicker.selectedRow(inComponent: 0)]
        guard let title = TitleInput.text, !title.isEmpty,
        let genre = GenreInput.text, !title.isEmpty,
        let description = DescriptionInput.text, !description.isEmpty else {
                showErrorAlert()
                return
        }
        //taking the users input and creating a new VideoGame
        newGame.Title = title
        newGame.Description = description
        newGame.Genre = genre
        newGame.Rating = selectedRating
        GameManager.sharedInstance.addGame(game: newGame)
        
        //this segue takes us back to the Video Game Library
        self.performSegue(withIdentifier: "unwindToVideoGameLibrary", sender: self)
        
        
    }
    

}
