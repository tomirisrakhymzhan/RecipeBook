//
//  ViewController.swift
//  RecipesBook
//
//  Created by Томирис Рахымжан on 25/03/2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var cookingTimeLabel: UILabel!
    
    @IBOutlet weak var difficultyLabel: UILabel!
    
    @IBOutlet weak var ingridientsLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var name = ""
    var cookingTime = ""
    var difficulty = ""
    var ingridients: [String] = []
    var recipeDescription = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        cookingTimeLabel.text = cookingTime
        difficultyLabel.text =  difficulty
        ingridientsLabel.text = "Ingridients:" + ingridients.joined(separator: ", ")
        descriptionLabel.text = "Description: " + recipeDescription
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
