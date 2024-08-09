//
//  MealDetailViewModel.swift
//  Fetch Challenge
//
//  Created by Amine Slaoui on 8/8/24.
//

import Foundation

@MainActor


class MealDetailViewModel: ObservableObject {
    @Published var meal: MealDetail?
    @Published var error: String?
    
    func getMealDetails(id: String) async{
        do {
            meal = try await apiService.shared.getDessertDetails(id: id)
        }catch {
            let errorMessage = "Failed to detailed instructions: \(error.localizedDescription)"
            print(errorMessage)
        }
    }
}
