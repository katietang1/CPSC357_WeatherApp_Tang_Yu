//
//  AddNewClothing.swift
//  WeatherApp_TangYu
//
//  Created by Katie Tang on 12/9/21.
//

import SwiftUI

struct AddNewClothing: View {
    
    // states of the different attributes
    @StateObject var clothingStore : ClothingStore
    @State private var name: String = ""
    @State private var clothingType: String = ""
    @State private var weatherType: String = ""
    @State private var description: String = ""
    
    var body: some View {
        // creating form user to add new item
        Form {
            Section(header: Text("Clothing Details")) {
                Image(systemName: "paintpalette.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.blue)
                    .padding()
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Clothing type", userInput: $clothingType)
                DataInput(title: "Weather type", userInput: $weatherType)
                DataInput(title: "Description", userInput: $description)
                .padding()
            }
            Button(action: addNewClothing) {
                Text("Add Clothes")
                //maybe show a message that its been added, or make it go back to list
            }
        }
    }
    func addNewClothing() {
        let newClothing = Clothing(id: UUID().uuidString,
                        name: name,
                        clothingType: clothingType,
                        description: description,
                        weatherType: weatherType,
                        imageName: "trenchcoat" )
        clothingStore.clothing.append(newClothing)
    } //drop down clothing type to top, bottom, shoes, or acessories
    //drop down weather type to cold, warm, or rain
}

struct DataInput: View {
    // creating user input boxes
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
            .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        .padding()
    }
}

struct AddNewClothing_Previews: PreviewProvider {
    static var previews: some View {
        AddNewClothing(clothingStore: ClothingStore(clothing: clothingData))
    }
}
