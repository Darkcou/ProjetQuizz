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
        ZStack{
        VStack {
            Spacer()
            HStack{                Image(systemName:"chevron.left").font(.largeTitle)
                Text("retour")
            Spacer()
            }.foregroundColor(.black)
            HStack{
                Spacer().frame(width:80)
                Text("connecter vous via game center")
                Image(systemName: "circle.fill")
            }.foregroundColor(.black)
            HStack{
                Spacer().frame(width:-90)
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.white)
                    .scaleEffect(5)
                
                Spacer().frame(width:55)
                
                VStack{
                    
                    Text("PROFIL")
                        .font(.title)
                    Text("Pseudo:\(user[0].name)")
                    Text("Age:")
                    Text("Ville:")
                }
                
            }
            .padding().frame(width:370,height:140)
            .background(Color.blue)
            .cornerRadius(10)
            
            Spacer()
            VStack{
                StatsTextView(name:"Meilleur score:")
                Spacer().frame(height:15)
                StatsTextView(name:"Nombre de partie:")
                Spacer().frame(height:15)
                StatsTextView(name:"Ratio:")
                Spacer().frame(height:15)
                StatsTextView(name:"Temps de jeu:")
                Spacer()
            }
            
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
            }.padding().frame(width:370,height:270)
                .background(Color.blue)
                .cornerRadius(10)
            Spacer().frame(height:30)
        }.foregroundColor(.white)
    }
}
}


 

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}

struct StatsTextView : View {
    var name:String
    var body : some View {
        Text(name).padding().frame(width:370,height:55).background(Color.gray).cornerRadius(10)
    }
}

 

/*Text("Temps de jeu:")
    .padding()
    .frame(width:370,height:55)
    .background(Color.gray)
    .cornerRadius(10)
Spacer()
*/

