//
//  RecipeslTableViewController.swift
//  RecipesBook
//
//  Created by Томирис Рахымжан on 24/03/2024.
//

import UIKit


class RecipesTableViewController: UITableViewController {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var dataSource: [Character: [Recipe]] = [:] {
        didSet {
            tableView.reloadData()
        }
    }
    var sectionTitles: [Character] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    
    enum SegmentTitle: String {
        case soups = "Soups"
        case salads = "Salads"
        case main = "Main"
        case desserts = "Desserts"
        case drinks = "Drinks"
    }
    
    var currentSegmentTitle: SegmentTitle {
        return SegmentTitle(rawValue: segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) ?? "") ?? .soups
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
        loadRecipes(forSegmentTitle: currentSegmentTitle)
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @objc
    func segmentedControlValueChanged(){
        loadRecipes(forSegmentTitle: currentSegmentTitle)
    }
    
    
     func loadRecipes(forSegmentTitle segmentTitle: SegmentTitle) {
        switch segmentTitle {
            case .soups:
                dataSource = groupRecipesByFirstLetter(recipes: Recipe.sampleData[0].list)
            case .salads:
                dataSource = groupRecipesByFirstLetter(recipes: Recipe.sampleData[1].list)
            case .main:
                dataSource = groupRecipesByFirstLetter(recipes: Recipe.sampleData[2].list)
            case .desserts:
                dataSource = groupRecipesByFirstLetter(recipes: Recipe.sampleData[3].list)
            case .drinks:
                dataSource = groupRecipesByFirstLetter(recipes: Recipe.sampleData[4].list)
        }
    }
    
    func groupRecipesByFirstLetter(recipes: [Recipe]) -> [Character: [Recipe]] {
        var result : [Character: [Recipe]] = [:]
        for recipe in recipes{
            guard let firstLetter = recipe.name.first else { return [:] }
            if result[firstLetter] != nil {
                result[firstLetter]?.append(recipe)
            } else {
                result[firstLetter] = [recipe]
            }
        }
        // Sort section titles alphabetically
        sectionTitles = result.keys.sorted()
        // Sort recipes within each section alphabetically
        for (key, value) in result {
            result[key] = result[key]?.sorted(by: {$0.name < $1.name})
        }
        
        return result
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sectionKey = sectionTitles[section]
        return dataSource[sectionKey]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionKey = sectionTitles[section]
        return String(sectionKey)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        let sectionKey = sectionTitles[indexPath.section]
        // Configure the cell...
        let recipeNameLabel = cell.viewWithTag(1000) as! UILabel
        let cookingTimeLabel = cell.viewWithTag(1001) as! UILabel
        let levelLabel = cell.viewWithTag(1002) as! UILabel
        
        
        if let recipesForLetter = dataSource[sectionKey] {
            let recipe = recipesForLetter[indexPath.row]
            recipeNameLabel.text = recipe.name
            cookingTimeLabel.text = recipe.cookingTime
            levelLabel.text = recipe.difficulty
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let sectionKey = Array(dataSource.keys)[indexPath.section]
            if var recipesForLetter = dataSource[sectionKey] {
                recipesForLetter.remove(at: indexPath.row)
                dataSource[sectionKey] = recipesForLetter
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }

    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
