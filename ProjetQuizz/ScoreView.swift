//
//  Score.swift
//  Exercices
//
//  Created by Sofiane Yekhlef on 19/03/2020.
//  Copyright © 2020 Sofiane Yekhlef. All rights reserved.
//

import SwiftUI

struct Score: View {
    
    let score:Int
    
    @State var themeView = false

    var body: some View {
        VStack{
            
            // Score
            Text("Score:\(score)")
                .font(.largeTitle)
                .padding().frame(width:370,height:140)
                .background(Color.blue)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            
            Spacer()
            
            // Badges
            VStack{
                VStack{
                    Text("Badges:") // ajout fonction badges
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
            .padding().frame(width:370,height:430)
            .background(Color.blue)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            
            Spacer()
            
            // Quitter
            NavigationLink(destination: ThemeView(), isActive: $themeView ){
                EmptyView()
            }
            Button(
                action: {
                    self.themeView = true
                },
                label: {
                    Text("Recommencer un quizz")
                        .foregroundColor(Color.white)
                        .font(.title)
                }
            )
            .padding().frame(width:370,height:100)
            .background(Color.red)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            
            Spacer()
            
            // Game center
            Text("Connectez vous via Game center ")
                .font(.headline)
                .padding().frame(width:370,height:100)
                .background(Color.gray)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)

        
    }
    
    
}

struct Score_Previews: PreviewProvider {
    static var previews: some View {
        Score(score: 0)
    }
}
