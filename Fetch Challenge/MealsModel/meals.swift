//
//  recipes.swift
//  Fetch Challenge
//
//  Created by Amine Slaoui on 8/8/24.
//

import Foundation

struct Meal: Decodable{
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}

struct MealDetail: Decodable {
    let strMeal: String
    let strInstructions: String
    let ingredients: [String: String] // [Ingredients: Measurements]
    
    enum CodingKeys: String, CodingKey {
        case strMeal, strInstructions
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5
        case strIngredient6, strIngredient7, strIngredient8, strIngredient9
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5
        case strMeasure6, strMeasure7, strMeasure8, strMeasure9
    }
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        
        var tempIngredients: [String: String] = [:]
        
        for i in 1...9 {
            if let ingredientKey = CodingKeys(rawValue: "strIngredient\(i)"),
               let measurementKey = CodingKeys(rawValue: "strMeasure\(i)"),
               let getIngredient = try? container.decode(String.self, forKey: ingredientKey),
               let measure = try? container.decode(String.self, forKey: measurementKey),
               
                // Add non-empty ingredient
               !getIngredient.isEmpty{
                tempIngredients[getIngredient] = measure
            }
            
        }
        print("Ingredients are: \(tempIngredients)")
        ingredients = tempIngredients
    }
}

// Use to fetch list of meals
struct mealList: Decodable {
    let meals: [Meal] // Contains ID + Name
}

// Use to fetch detailed information
struct MealDetailList: Decodable {
    let meals: [MealDetail] // Contains instructions + measurement + ingredients + name
}
