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
    
    @IBOutlet weak var DescriptionInput: UITextField!
    
    @IBOutlet weak var SubmitButton: UIButton!
    
    
    let rating = ["E", "E 10+", "T", "M", "A"]
    
    var newGame: VideoGame!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        // Do any additional setup after loading the view.
    }

    
    func showErrorAlert() {
        let errorAlert = UIAlertController(title: "Error", message: "Please fill out all fields before submitting your video game.", preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        errorAlert.addAction(dismissAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            destination.allGames.append(newGame)
            destination.TableView.reloadData()
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rating.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rating[row]
    }

    
    @IBAction func SubmitNewGame(_ sender: Any) {
        let selectedRating = rating[RatingPicker.selectedRow(inComponent: 0)]
        guard let title = TitleInput.text, !title.isEmpty,
        let genre = GenreInput.text, !title.isEmpty,
        let description = DescriptionInput.text, !description.isEmpty else {
                showErrorAlert()
                return
        }
        
        newGame = VideoGame(Title: title, Genre: genre, Rating: selectedRating, Description: description)
        self.performSegue(withIdentifier: "unwindToVideoGameLibrary", sender: self)
        
        
    }
    

}
