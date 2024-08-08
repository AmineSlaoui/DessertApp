//
//  MealListViewModel.swift
//  Fetch Challenge
//
//  Created by Amine Slaoui on 8/8/24.
//

import Foundation


@MainActor
class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var error: String?
    
    func getMeals() async {
        do {
            meals = try await apiService.shared.getDessert()
            print("Meals fetched in view model: \(meals)")
        } catch {
            let errorMessage = "Failed to load meals: \(error.localizedDescription)"
            print(errorMessage)
        }
    }
}

