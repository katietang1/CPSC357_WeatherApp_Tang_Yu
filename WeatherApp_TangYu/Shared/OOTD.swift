//
//  OOTD.swift
//  WeatherApp_TangYu
//
//  Created by Katie Tang on 12/2/21.
//

import SwiftUI

struct OOTD: View {
    //puts together an outfit with top, bottom, shoes based on weather 
    @StateObject var weather = WeatherViewModel()
    var body: some View {
        ZStack{
            VStack{
                    Text("✨Outfit of the Day✨")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Spacer()
                VStack{
                    HStack{
                        Image(chooseTop())
                            .resizable()
                            .frame(width: 250, height: 250)
                            .multilineTextAlignment(.trailing)
                    }.background(Color.white)
                    Spacer()
                    HStack{
                        Image(chooseBottom())
                            .resizable()
                            .frame(width: 200, height: 350)
                            .multilineTextAlignment(.trailing)
                    }
                    Spacer()
                    HStack{
                        Image(chooseShoes())
                            .resizable()
                            .frame(width: 150, height: 150)
                            .multilineTextAlignment(.trailing)
                    }
                    Spacer()
                }.background(Color.white)
               
            }
            
        }
        
    }
    //display top based on weather
    func chooseTop() -> String{
        var topChosen: String = ""
        if weather.title == "Rain"{
            topChosen = "windbreaker"
        }
        else if Int(weather.temp) ?? 0 <= 40{
            topChosen = "sherlingjacket"
        }
        else if Int(weather.temp) ?? 0 <= 50{
            topChosen = "bomberjacket"
        }
        else if Int(weather.temp) ?? 0 <= 60{
            topChosen = "cardigan"
        }
        else if Int(weather.temp) ?? 0 <= 70{
            topChosen = "turtleneck"
        }
        else if Int(weather.temp) ?? 0 <= 80{
            topChosen = "blouse"
        }
        else if Int(weather.temp) ?? 0 <= 90{
            topChosen = "shirt"
        }
        else if Int(weather.temp) ?? 0 <= 100{
            topChosen = "tanktop"
        }
        else{
            topChosen = "shirt"
        }
        
        return topChosen
    }
    //display bottom based on weather
    func chooseBottom() -> String{
        var bottomChosen: String = ""
        
        if Int(weather.temp) ?? 0 <= 60{
            bottomChosen = "sweatpants"
        }
        else if Int(weather.temp) ?? 0 <= 70{
            bottomChosen = "cargopants"
        }
        else if Int(weather.temp) ?? 0 <= 80 || ((Int(weather.temp) ?? 0 > 80 && Int(weather.temp) ?? 0 < 90)){
            bottomChosen = "flareshorts"
        }
        else if Int(weather.temp) ?? 0 >= 90{
            bottomChosen = "runningshorts"
        }
        else{
            bottomChosen = "cargopants"
        }
        
        return bottomChosen
    }
    //choose shoes based on weather
    func chooseShoes() -> String{
        var shoesChosen: String = ""
        
        if Int(weather.temp) ?? 0 < 70 || weather.title == "Rain" || weather.title == "Thunderstorm" || weather.title == "Snow" || weather.title == "Drizzle"{
            shoesChosen = "boot"
        }
        else if Int(weather.temp) ?? 0 >= 70 && Int(weather.temp) ?? 0 <= 80{
            shoesChosen = "loafer"
        }
        else if Int(weather.temp) ?? 0 >= 90 {
            shoesChosen = "flipflop"
        }
        else{
            shoesChosen = "loafer"
        }
        
        return shoesChosen
    }
}




struct OOTD_Previews: PreviewProvider {
    static var previews: some View {
        OOTD()
    }
}
