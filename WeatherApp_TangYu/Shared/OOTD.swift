//
//  OOTD.swift
//  WeatherApp_TangYu
//
//  Created by Katie Tang on 12/2/21.
//

import SwiftUI

struct OOTD: View {
   
    var body: some View {
        ZStack{
            BackgroundView(topColor:.pink, bottomColor: .purple)
            VStack{
                Text("Based on today's weather, you should wear:")
                    .foregroundColor(.white)
                //maybe add the weather temp and type
                Spacer()
                HStack{
                    Text("Top:")
                        .foregroundColor(.white)
                    Text ("Clothing image here")
                }
                HStack{
                    Text("Bottom:")
                        .foregroundColor(.white)
                    Text ("Clothing image here")
                }
                HStack{
                    Text("Shoes:")
                        .foregroundColor(.white)
                    Text ("Clothing image here")
                }
                Spacer()
            }
            
        }
        
    }

}



struct OOTD_Previews: PreviewProvider {
    static var previews: some View {
        OOTD()
    }
}
