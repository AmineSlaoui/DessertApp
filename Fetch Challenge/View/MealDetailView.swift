//
//  MealDetailListView.swift
//  Fetch Challenge
//
//  Created by Amine Slaoui on 8/8/24.
//

import SwiftUI

// View displays info about meal such as name, instructions, ingredients, measurements
struct MealDetailView: View {
    let mealID: String
    @StateObject private var viewModel = MealDetailViewModel()
    
    var body: some View{
        
        VStack {
            if let meal = viewModel.meal{
                Text(meal.strMeal)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.top)
                
                Text("Instructions")
                    .font(.headline)
                    .padding(.vertical, 3)
                Text(meal.strInstructions)
                    .font(.body)
                    .padding(.bottom)
                
                
                Text("Ingredients with measurements")
                    .font(.headline)
                    .padding(.vertical, 3)
                List(meal.ingredients.keys.sorted(), id: \.self) {
                    key in if let value = meal.ingredients[key] {
                        Text("\(key): \(value)")
                    }
                }
                
            }
            else{
                ProgressView()
            }
        }
        .padding(.horizontal, 4)
        .navigationTitle("Dessert Details")
        .task {
            await viewModel.getMealDetails(id: mealID)
        }
    }
}
