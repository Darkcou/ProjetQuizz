//
//  Information.swift
//  ProjetQuizz
//
//  Created by AxelGilbin on 17/03/2020.
//  Copyright © 2020 Benjamin Gronier. All rights reserved.
//

import SwiftUI

struct InformationScreen: View {
    var body: some View {
        ZStack{
            VStack{
                HStack{                Image(systemName:"chevron.left").font(.largeTitle)
                    Text("retour\rquiz")
                    Spacer()
                }
                
                Spacer().frame(height:50)
                Image(information[0].image)
                
                Spacer().frame(height:100)
                Text(information[0].text)
                
                Spacer()
                Text(information[0].lien)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                
                Spacer().frame(height: 100)
            }
        }
    }
}

struct InformationScreen_Previews: PreviewProvider {
    static var previews: some View {
        InformationScreen()
    }
}
