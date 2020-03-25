//
//  ContentView.swift
//  ProjetQuizz
//
//  Created by Benjamin Gronier on 16/03/2020.
//  Copyright © 2020 Benjamin Gronier. All rights reserved.
//


import SwiftUI

struct CreerQuestionView: View {
    @State private var theme: String = "\tNature"
    @State private var question: String = "\tsaisir votre question ..."
    @State private var bonneReponse: String = "\tSaisir la bonne reponse"
    @State private var repnseErronee1: String = "\tSaisir réponse erronée1"
    @State private var repnseErronee2: String = "\tSaisir réponse erronée2"
    @State private var repnseErronee3: String = "\tSaisir réponse erronée3"
    @State private var source: String = "saisir votre source...(lien,video ect...)"
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("theme:").font(.title)
                    Spacer()
                }
                
                TextField("\tSélectionner un thème...", text: $theme).padding().border(Color.black).frame(width:340).cornerRadius(10)
                
                Text("Image:").font(.title)}
            
            VStack{
                HStack{
                    Text("Question:").font(.title)
                    Spacer()}
                TextField("\tsaisir votre question ...", text: $question).padding().border(Color.black).frame(width:340).cornerRadius(10)
                
                TextField("\tsaisir la bonne reponse...", text: $bonneReponse).padding().border(Color.black).frame(width:340).foregroundColor(.white).background(Color.green).cornerRadius(10)
                
                TextField("\tsaisir réponse erronée 1", text: $repnseErronee1).padding().border(Color.black).frame(width:340).foregroundColor(.white).background(Color.red).cornerRadius(10)
                
                TextField("\tsaisir réponse erronée 2", text: $repnseErronee2).padding().border(Color.black).frame(width:340).foregroundColor(.white).background(Color.red).cornerRadius(10)
                
                TextField("\tsaisir réponse erronée 3", text: $repnseErronee3).padding().border(Color.black).frame(width:340).foregroundColor(.white).background(Color.red).cornerRadius(10)
            }.padding().border(Color.black).cornerRadius(10).frame(width:380,height:450)
            
            HStack{
                Text("Source:").font(.title)
            }
            VStack{
                TextField("\tsaisir votre source...(lien,video ect)", text: $source).padding().border(Color.black).frame(width:340).cornerRadius(10)
            }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CreerQuestionView()
    }
}
