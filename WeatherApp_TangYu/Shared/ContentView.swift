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
        //tab view
        TabView(selection: $selection){
                Forecast()
                .tabItem {
                    Label("Forecast", systemImage: "cloud")
                } .tag(1)
            
            OOTD()
                .tabItem {
                    Label("OOTD", systemImage: "sparkles")
                } .tag(2)
            
            MyCloset()
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
            .preferredColorScheme(.light)
    }
}
