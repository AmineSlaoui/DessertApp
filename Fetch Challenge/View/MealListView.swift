//
//  MealListView.swift
//  Fetch Challenge
//
//  Created by Amine Slaoui on 8/8/24.
//

import SwiftUI


struct MealListView: View {
    @StateObject private var viewModel = MealListViewModel()
    
    var body: some View{
        NavigationView{
            List(viewModel.meals, id: \.idMeal) {
                meal in NavigationLink(destination: MealDetailView(mealID: meal.idMeal))
                { HStack {
                    if let url = URL(string: meal.strMealThumb){
                        AsyncImage(url: url) {
                            image in image.resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    Text(meal.strMeal)
                    }
                }
            }
            .navigationTitle("Desserts")
            .task {
                await viewModel.getMeals()
            }
        }
    }
}

struct MealsListView_Preview: PreviewProvider{
    static var previews: some View {
        MealListView()
    }
}
