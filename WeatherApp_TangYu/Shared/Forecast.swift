//
//  Forecast.swift
//  WeatherApp_TangYu
//
//  Created by Katie Tang on 12/2/21.
//

import SwiftUI

struct Forecast: View {
    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        ZStack {
            BackgroundView(topColor: getCurrentTime() ? .black : .blue, bottomColor: getCurrentTime() ? .gray : Color("lightBlue"))
            VStack{
                Spacer()
                Text(getCurrentDate())
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Text("Orange")
                    .font(.system(size: 25, weight: .medium, design: .default))
                    .foregroundColor(.white)
            VStack{
                Image(systemName: getCurrentTime() ? checkWeather(viewModel.title) : checkWeather(viewModel.title))
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height:180)
                Text(viewModel.temp)
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Text(viewModel.title)
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .foregroundColor(.white)
                }
                Spacer()
//                Button {
//                    getCurrentTime().toggle()
//                } label: {
//                    Text("Switch Day Time")
//                        .frame(width: 150, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(.blue)
//                        .background(Color("opacityBlue"))
//                        .font(.system(size: 15))
//                        .cornerRadius(10)
//                }
                Spacer()
            }
        }
    }
    func checkWeather(_ weather: String) -> String{
        switch weather{
        case "Clear":
            return "sun.max.fill"
        case "Haze":
            return "sun.haze.fill"
        case "Rain":
            return "cloud.rain.fill"
        case "Drizzle":
            return "cloud.drizzle.fill"
        case "Thunderstorm":
            return "cloud.bolt.rain.fill"
        case "Snow":
            return "cloud.snow.fill"
        case "Clouds":
            return "cloud.fill"
        case "Fog":
            return "cloud.fog.fill"
        default:
            return "sun.max.fill"
        }
    }
    
    func getCurrentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM, dd, yyyy")
        return dateFormatter.string(from: date)
        
    }
    
    func getCurrentTime() -> Bool {
        var isNight: Bool
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        if hour >= 20
        {
            isNight = true
        } else {
            isNight = false
        }
        return isNight
    }
}



struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Forecast_Previews: PreviewProvider {
    static var previews: some View {
        Forecast()
    }
}
