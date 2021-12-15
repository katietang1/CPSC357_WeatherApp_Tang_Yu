//
//  OOTD.swift
//  WeatherApp_TangYu
//
//  Created by Katie Tang on 12/2/21.
//

import SwiftUI

struct OOTD: View {
    @StateObject var weather = WeatherViewModel()
    var body: some View {
        ZStack{
            BackgroundView(topColor:.orange, bottomColor: .purple)
            VStack{
                Text("Outfit of the Day!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                //maybe add the weather temp and type
                Spacer()
                HStack{
                    Text("Top:")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    Text (chooseTop())
                        .multilineTextAlignment(.trailing)
                }
                Spacer()
                HStack{
                    Text("Bottom:")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    Text (chooseBottom())
                        .multilineTextAlignment(.trailing)
                }
                Spacer()
                HStack{
                    Text("Shoes:")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    Text (chooseShoes())
                        .multilineTextAlignment(.trailing)
                }
                Spacer()
            }
            
        }
        
    }
    
    func chooseTop() -> String{
        var topChosen: String = ""
        if Int(weather.temp) ?? 0 < 50{
            topChosen = "turtleneck"
        }
        else if Int(weather.temp) ?? 0 < 60{
            if weather.title == "Rain"{
                topChosen = "turtleneck"
            }
            else{
                topChosen = "blouse"
            }
        }
        else if Int(weather.temp) ?? 0 < 70{
            if weather.title == "Clear" || weather.title == "Haze" || weather.title == "Fog" || weather.title == "Clouds" {
                topChosen = "shirt"
            }
            if weather.title == "Rain"{
                topChosen = "blouse"
            }
        }
        else if Int(weather.temp) ?? 0 > 90{
            topChosen = "tank"
        }
        else{
            topChosen = "shirt"
        }
        
        return topChosen
    }
    
    func chooseBottom() -> String{
        var bottomChosen: String = ""
        if Int(weather.temp) ?? 0 < 50{
            bottomChosen = "pants"
        }
        else if Int(weather.temp) ?? 0 < 60{
            if weather.title == "Rain"{
                bottomChosen = "pants"
            }
            else{
                bottomChosen = "pants"
            }
        }
        else if Int(weather.temp) ?? 0 < 70{
            if weather.title == "Clear" || weather.title == "Haze" || weather.title == "Fog" || weather.title == "Clouds" {
                bottomChosen = "shorts"
            }
            if weather.title == "Rain"{
                bottomChosen = "pants"
            }
        }
        else if Int(weather.temp) ?? 0 > 90{
            bottomChosen = "shorts"
        }
        else{
            bottomChosen = "pants"
        }
        
        return bottomChosen
    }
    
    func chooseShoes() -> String{
        var shoesChosen: String = ""
        
        if weather.title == "Rain"{
            shoesChosen = "boots"
        }
        else if weather.title == "Clear" && Int(weather.temp) ?? 0 > 90 {
            shoesChosen = "sandals"
        }
        else{
            shoesChosen = "shoes"
        }
        
        return shoesChosen
    }
}




struct OOTD_Previews: PreviewProvider {
    static var previews: some View {
        OOTD()
    }
}
