//
//  Information.swift
//  ProjetQuizz
//
//  Created by AxelGilbin on 17/03/2020.
//  Copyright © 2020 Benjamin Gronier. All rights reserved.
//

import SwiftUI

struct InformationScreen: View {
    
    let info:Informations
    var body: some View {
        ZStack{
            VStack{
                
                Spacer().frame(height:50)
                Image(info.image)
                
                Spacer().frame(height:100)
                Text(info.text)
                
                Spacer()

                Button(
                    action: {
//                        self.info.lien
                },
                    label: {
                        
                        Text("Visiter le site officiel")
                            .bold()
                            .foregroundColor(Color.white)
                }
                )
                    .frame(width:200,height:50)
                    .background(Color.blue)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                
                Spacer().frame(height: 100)
            }
        }
    }
}

struct InformationScreen_Previews: PreviewProvider {
    static var previews: some View {
        InformationScreen(info: Informations(image: "", text: "", lien: ""))
    }
}
