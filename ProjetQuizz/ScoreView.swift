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
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            
            
            Spacer()
                .frame(height: 13.0)
            VStack{
                VStack{
                    Text("Badges:") // ajout fonction badges
                        .font(.largeTitle)}
                Spacer()
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
                Spacer()
            }
            .padding().frame(width:370,height:430)
            .background(Color.blue)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            Spacer()
                .frame(height: 39.0)
            Text("Quitter") // ajouter fonction leave
                .font(.largeTitle)
                .padding().frame(width:370,height:100)
                .background(Color.red)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            Spacer()
            Text("Connectez vous via Game center ") // ajouter fonction login
                .font(.headline)
                .padding().frame(width:370,height:100)
                .background(Color.gray)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            
            
        }
        
    }
    
    
}

struct Score_Previews: PreviewProvider {
    static var previews: some View {
        Score()
    }
}
