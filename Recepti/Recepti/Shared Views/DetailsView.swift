//
//  DetailsView.swift
//  Recepti
//
//  Created by MacLab6 on 5.11.22..
//

import SwiftUI

struct DetailsView: View {
    @StateObject var viewModel = DetailsViewModel()
    var mealId: String
    var body: some View {
        ScrollView{
            VStack{
                if let details = viewModel.details{
                    AsyncImage(url: URL(string:details.strMealThumb)){
                        image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    Text(details.strMeal).font(.title)
                }
            }.onAppear{
                viewModel.fetchDetails(mealId: mealId)
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
      DetailsView(mealId: "52772")
        
    }
}
