//
//  userProfile.swift
//  ProjetQuizz
//
//  Created by AxelGilbin on 19/03/2020.
//  Copyright © 2020 Benjamin Gronier. All rights reserved.
//

import SwiftUI


struct test: View {
    
    var body: some View {
        
            
        VStack {
        
            Text("Profil")
                .font(.largeTitle)
                    
            HStack{
                Text("connecter vous via game center")
                Image(systemName: "circle.fill")
            }
            .foregroundColor(.black)
            
            // info User
            HStack{
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width:80, height: 80)
                
                Spacer().frame(width:40)
                
                VStack{
    
                    Text("Pseudo:\(user[0].name)")
                    Text("Age:")
                    Text("Ville:")
                }
                
            }
            .frame(width:370,height:140)
            .background(Color.blue)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            
            Spacer()
            
            // Stats
            VStack{
                
                StatsTextView(name:"Meilleur score:")
                Spacer()
                StatsTextView(name:"Nombre de partie:")
                Spacer()
                StatsTextView(name:"Ratio:")
                Spacer()
                StatsTextView(name:"Temps de jeu:")
                Spacer()
            }
            
            // Badges
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
            .padding()
            .frame(width:370,height:270)
            .background(Color.blue)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            
        }
        
    }
}

struct StatsTextView : View {
    
    var name:String
    var body : some View {
        
        Text(name)
            .frame(width:370,height:55)
            .background(Color.gray)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
    }
}
 

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}

/*Text("Temps de jeu:")
    .padding()
    .frame(width:370,height:55)
    .background(Color.gray)
    .cornerRadius(10)
Spacer()
*/

