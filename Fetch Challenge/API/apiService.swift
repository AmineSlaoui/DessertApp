//
//  apiService.swift
//  Fetch Challenge
//
//  Created by Amine Slaoui on 8/8/24.
//

import Foundation

// Make API calls and get meal info
class apiService {
    static let shared = apiService()
    
    func getDessert() async throws -> [Meal] {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")! // Exclamation point forces url to be unwrapped
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(mealList.self, from: data) // Converts JSON data into struct
        
        print("Fetched meals: \(response.meals)")
        
        return response.meals.sorted{$0.strMeal < $1.strMeal}
    }
    
    func getDessertDetails(id: String) async throws -> MealDetail {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealDetailList.self, from: data)
        return response.meals.first!
    }
}
