//
//  ContentView.swift
//  Shared
//
//  Created by Katie Tang on 11/21/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        TabView(selection: $selection){
            VStack{
                Text(viewModel.timezone)
                    .font(.system(size: 32))
                Text(viewModel.temp)
                    .font(.system(size: 44))
                Text(viewModel.title)
                    .font(.system(size: 24))
                Text(viewModel.descriptionText)
                    .font(.system(size: 24))
            }
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
                }.tag(3)
            
        }.font(.largeTitle)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
