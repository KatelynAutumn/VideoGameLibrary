//
//  DescriptionViewController.swift
//  Video-Game-Library
//
//  Created by Katelyn Pace on 10/16/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    //creating a class for each game to follow
    var selectedGame: VideoGame!

    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var GenreLabel: UILabel!
    
    @IBOutlet weak var RatingLabel: UILabel!
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //displaying all the selected games information
        TitleLabel.text = selectedGame.Title
        GenreLabel.text = selectedGame.Genre
        RatingLabel.text = selectedGame.Rating
        DescriptionLabel.text = selectedGame.Description

        // Do any additional setup after loading the view.
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
