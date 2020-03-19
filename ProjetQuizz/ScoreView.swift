//
//  Score.swift
//  Exercices
//
//  Created by Sofiane Yekhlef on 19/03/2020.
//  Copyright © 2020 Sofiane Yekhlef. All rights reserved.
//

import SwiftUI

struct Score: View {
    var body: some View {
        VStack{
            Text("Score:") // ajouter fonction score
                .font(.largeTitle)
                .padding().frame(width:370,height:140)
                .background(Color.blue)
                .cornerRadius(10)
            Spacer()
            VStack{
                VStack{
                    Text("Badges:")
                        .font(.largeTitle)}
                HStack{
                    Image(badge[0].logo)
                    VStack{
                        Text(badge[0].description)}}
                HStack{
                    Image(badge[0].logo)
                    VStack{
                        Text(badge[0].description)
                    }
                }
            }
            
        }
    }
}

struct Score_Previews: PreviewProvider {
    static var previews: some View {
        Score()
    }
}
