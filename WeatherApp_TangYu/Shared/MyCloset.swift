//
//  MyCloset.swift
//  WeatherApp_TangYu
//
//  Created by Katie Tang on 12/2/21.
//

import SwiftUI

struct MyCloset: View {
    
    @StateObject private var clothingStore: ClothingStore = ClothingStore(clothing: clothingData)
    
    var body: some View {
        //creating general list
        NavigationView {
        List{
            ForEach (clothingStore.clothing) { clothing in
                ListCell(clothing: clothing)
                }
            .onDelete(perform: deleteItems)
            .onMove(perform: moveItems)
            }
        .navigationBarTitle(Text("My Closet"))
        .navigationBarItems(leading: NavigationLink(destination: AddNewClothing(clothingStore: self.clothingStore)) {
            Text("Add")
                .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    //adding delete and move functions
    func deleteItems(at offsets: IndexSet) {
        clothingStore.clothing.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int) {
        clothingStore.clothing.move(fromOffsets: source, toOffset: destination)
    }
}

struct MyCloset_Previews: PreviewProvider {
    static var previews: some View {
        MyCloset()
    }
}

struct ListCell: View {
    
    var clothing: Clothing
    
    var body: some View {
        NavigationLink(destination: ClothingDetail(selectedClothing: clothing)) {
        HStack {
            Image(clothing.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(clothing.name)
            }
        }
    }
}
