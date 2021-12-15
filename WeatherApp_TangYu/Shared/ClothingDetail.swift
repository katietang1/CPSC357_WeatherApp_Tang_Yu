//
//  ClothingDetail.swift
//  WeatherApp_TangYu
//
//  Created by Katie Tang on 12/9/21.
//

import SwiftUI

struct ClothingDetail: View {
    
    let selectedClothing: Clothing
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Clothing Details")) {
                        Image(selectedClothing.imageName)
                        .resizable()
                        .cornerRadius(12.0)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .animation(.easeInOut(duration:5 ))
                }
                Section(header: Text("Clothing Name")){
                    Text(selectedClothing.name)
                        .font(.headline)
                }
                Section(header: Text("Description")){
                    Text(selectedClothing.description)
                        .font(.body)
                }
                Section(header: Text("Type")){
                    Text(selectedClothing.clothingType)
                        .font(.body)
                }
                Section(header: Text("Weather Type")){
                        Text(selectedClothing.weatherType)
                            .font(.body)
                }
            }
        }
    }
}

struct ClothingDetail_Previews: PreviewProvider {
    let selectedClothing: Clothing
    
    static var previews: some View {
        ClothingDetail(selectedClothing: clothingData[0])
    }
}
