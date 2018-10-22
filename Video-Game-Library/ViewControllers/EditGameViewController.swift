//
//  EditGameViewController.swift
//  Video-Game-Library
//
//  Created by Katelyn Pace on 10/18/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit

class EditGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var gameToEdit: VideoGame!

    @IBOutlet weak var EditTitle: UITextField!
    
    @IBOutlet weak var GenreEdit: UITextField!
    
    @IBOutlet weak var editRating: UIPickerView!
    
    @IBOutlet weak var editDescription: UITextField!
    
    @IBOutlet weak var RatingPicker: UIPickerView!
    
    
    let rating = ["E", "E 10+", "T", "M", "A"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EditTitle.text = gameToEdit.Title
        GenreEdit.text = gameToEdit.Genre
        editDescription.text = gameToEdit.Description
        // Do any additional setup after loading the view.
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
    
    
    func showErrorAlert() {
        let errorAlert = UIAlertController(title: "Error", message: "Please fill out all fields before submitting your video game.", preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Close", style: .default){
            _ in
        }
        errorAlert.addAction(dismissAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func SubmitGame(_ sender: Any) {
        let selectedRating = rating[RatingPicker.selectedRow(inComponent: 0)]
        guard let title = EditTitle.text, !title.isEmpty,
            let genre = GenreEdit.text, !title.isEmpty,
            let description = editDescription.text, !description.isEmpty else {
                showErrorAlert()
                return
        }
        
        gameToEdit = VideoGame(Title: title, Genre: genre, Rating: selectedRating, Description: description)
        self.performSegue(withIdentifier: "unwindToVideoGameLibrary", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
