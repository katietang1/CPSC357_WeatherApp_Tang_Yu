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
            HStack {
                Form {
                    Section(header: Text("Clothing Details")) {
                            Image(selectedClothing.imageName)
                            .resizable()
                            .cornerRadius(12.0)
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .animation(.easeInOut(duration:5 ))
                            Text(selectedClothing.name)
                                .font(.headline)
                            Text(selectedClothing.description)
                                .font(.body)
                            Text(selectedClothing.clothingType)
                                .font(.body)
                            Text(selectedClothing.weatherType)
                                .font(.body)
                            HStack {
//                                Text("Alive or Dead").font(.headline)
//                                Spacer()
//                                // character status symbol
//                                Image(systemName: selectedCharacter.isAlive ?
//                                        "heart.circle.fill" : "heart.slash.circle.fill" )
//                                    .foregroundColor(Color.red)
                        }
                        // slider for user to interact with picture rotation
//                        Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                            .padding()
                        }
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
