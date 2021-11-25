//
//  ContentView.swift
//  Shared
//
//  Created by Katie Tang on 11/21/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection){
            
            Text("weather stuff here")
                .tabItem {
                    Label("Forecast", systemImage: "cloud")
                } .tag(1)
            
            Text("Outfit Suggestions here")
                .tabItem {
                    Label("OOTD", systemImage: "sparkles")
                } .tag(2)
            
            Text("List of clothes")
                .tabItem {
                    Label("My Closet", systemImage: "face.smiling")
                    //tried to use tshirt but didnt work
                } .tag(3)
            
        }.font(.largeTitle)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
