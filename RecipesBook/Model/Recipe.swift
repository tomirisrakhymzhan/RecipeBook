//
//  Recipe.swift
//  RecipesBook
//
//  Created by Томирис Рахымжан on 24/03/2024.
//

import Foundation
struct Recipe {
    let name: String
    let cookingTime: String
    let difficulty: String
    let ingredients: [String]
    let description: String
}

struct RecipeCategoryList{
    let category: String
    let list: [Recipe]
}

// Data source of recipes
extension Recipe {
    static let sampleData : [RecipeCategoryList] = [
        RecipeCategoryList(category: "Soup", list: soups),
        RecipeCategoryList(category: "Salads", list: salads),
        RecipeCategoryList(category: "Main dishes", list: mainDishes),
        RecipeCategoryList(category: "Desserts", list: desserts),
        RecipeCategoryList(category: "Drinks", list: drinks)
    
    ]
    static let soups: [Recipe] = [
        Recipe(name: "Tomato Soup",
               cookingTime: "30 minutes",
               difficulty: "Easy",
               ingredients: ["Tomatoes", "Onion", "Garlic", "Vegetable Stock", "Salt", "Pepper", "Basil"],
               description: "A classic tomato soup with basil and garlic, perfect for a cozy evening."),
        Recipe(name: "Chicken Noodle Soup",
               cookingTime: "45 minutes",
               difficulty: "Medium",
               ingredients: ["Chicken Breast", "Carrots", "Celery", "Onion", "Chicken Broth", "Egg Noodles", "Thyme", "Bay Leaf"],
               description: "A hearty chicken noodle soup loaded with vegetables and tender chicken breast."),
    ]
    
    static let salads: [Recipe] = [
        Recipe(name: "Caesar Salad",
               cookingTime: "15 minutes",
               difficulty: "Easy",
               ingredients: ["Romaine Lettuce", "Croutons", "Parmesan Cheese", "Caesar Dressing"],
               description: "Classic Caesar salad with crisp lettuce, crunchy croutons, and tangy dressing."),
        Recipe(name: "Greek Salad",
               cookingTime: "20 minutes",
               difficulty: "Easy",
               ingredients: ["Cucumbers", "Tomatoes", "Red Onion", "Kalamata Olives", "Feta Cheese", "Olive Oil", "Lemon Juice", "Oregano"],
               description: "A refreshing salad with cucumbers, tomatoes, olives, and feta cheese, dressed in olive oil and lemon juice."),
    ]
    
    static let mainDishes: [Recipe] = [
        Recipe(name: "Spaghetti Carbonara",
               cookingTime: "25 minutes",
               difficulty: "Medium",
               ingredients: ["Spaghetti", "Bacon", "Eggs", "Parmesan Cheese", "Garlic", "Black Pepper"],
               description: "A classic Italian pasta dish made with spaghetti, crispy bacon, eggs, and Parmesan cheese."),
        Recipe(name: "Chicken Parmesan",
               cookingTime: "40 minutes",
               difficulty: "Medium",
               ingredients: ["Chicken Breast", "Breadcrumbs", "Marinara Sauce", "Mozzarella Cheese", "Parmesan Cheese", "Basil", "Olive Oil"],
               description: "Tender breaded chicken breasts topped with marinara sauce and melted mozzarella cheese, served with pasta."),
    ]
    
    static let desserts: [Recipe] = [
        Recipe(name: "Chocolate Cake",
               cookingTime: "50 minutes",
               difficulty: "Medium",
               ingredients: ["Flour", "Sugar", "Cocoa Powder", "Eggs", "Milk", "Butter", "Vanilla Extract", "Baking Powder", "Salt"],
               description: "Rich and moist chocolate cake that's perfect for any occasion."),
        Recipe(name: "Apple Pie",
               cookingTime: "1 hour",
               difficulty: "Medium",
               ingredients: ["Apples", "Pie Crust", "Sugar", "Cinnamon", "Butter", "Flour"],
               description: "Classic homemade apple pie with a flaky crust and warm cinnamon-spiced apples."),
    ]
    
    static let drinks: [Recipe] = [
        Recipe(name: "Mojito",
               cookingTime: "10 minutes",
               difficulty: "Easy",
               ingredients: ["White Rum", "Fresh Mint Leaves", "Lime Juice", "Simple Syrup", "Club Soda", "Ice"],
               description: "A refreshing Cuban cocktail made with rum, mint, lime juice, and soda water."),
        Recipe(name: "Margarita",
               cookingTime: "10 minutes",
               difficulty: "Easy",
               ingredients: ["Tequila", "Triple Sec", "Lime Juice", "Simple Syrup", "Salt", "Ice"],
               description: "A classic Mexican cocktail made with tequila, lime juice, and orange liqueur, served with a salted rim."),
    ]
}
