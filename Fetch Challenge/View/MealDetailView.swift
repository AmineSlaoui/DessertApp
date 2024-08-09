//
//  MealDetailListView.swift
//  Fetch Challenge
//
//  Created by Amine Slaoui on 8/8/24.
//

import SwiftUI

struct MealDetailView: View {
    let mealID: String
    @StateObject private var viewModel = MealDetailViewModel()
    
    var body: some View{
        VStack {
            if let meal = viewModel.meal{
                Text(meal.strMeal).font(.largeTitle)
                Text(meal.strInstructions)
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
        .navigationTitle("Meal Details")
        .task {
            await viewModel.getMealDetails(id: mealID)
        }
    }
}
