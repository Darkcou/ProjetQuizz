//
//  Questionnaire_View.swift
//  ProjetQuizz
//
//  Created by annecrepin on 17/03/2020.
//  Copyright © 2020 Benjamin Gronier. All rights reserved.
//

import SwiftUI

struct Questionnaire_View: View {
    
    @State var numQuestion:Int = 1
    @State var score:Int = 0
    
    @State var questionPosée = question.randomElement()!
    
    @State var win:Bool = false
    
    @State var infoView = false
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                Text("Score:\(score)")
                Spacer()
                Text("Question \(numQuestion)")
                    .font(.system(Font.TextStyle.largeTitle))
                    .padding()
                
                Spacer()
                Text(questionPosée.sentence)
                    .font(.system(Font.TextStyle.title))
                    .bold()
                    
                
                Spacer()
                
                ForEach(questionPosée.responses.shuffled()) { reponse in
                    
                    
                    ButtonStyle(action: {
                        
                        if reponse.isGoodResponse == true{
                            self.win = true
                        }else{
                            self.win = false
                        }
                        
                    }, text: reponse.sentence)
                    
                    
                }
                
                Spacer()
                
                HStack{
                    
                    NavigationLink(destination: InformationScreen(info: questionPosée.information), isActive: $infoView ){
                        
                        EmptyView()
                        
                    }
                    
                    Button(
                        action: {
                            self.infoView = true
                            
                    },
                        label: {
                            
                            Text("En savoir plus")
                                .bold()
                                .foregroundColor(Color.white)
                    }
                    )
                        .frame(width:150,height:50)
                        .background(Color.gray)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .padding()
                        .buttonStyle(PlainButtonStyle())
                    
                }
                
                
                Button(
                    action: {
                        
                        self.numQuestion += 1
                        if self.win == true {
                            
                            self.score += 100
                            self.win = false
                            self.questionPosée = question.randomElement()!
                        }else{
                            self.questionPosée = question.randomElement()!
                        }
                         
                        
                },
                    label: {
                        
                        Text("Suivant")
                            .bold()
                            .foregroundColor(Color.white)
                }
                )
                    .frame(width:150,height:50)
                    .background(Color.gray)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                
            }
        }
    }
}
struct ButtonStyle: View {
    var action: ()-> Void
    var text: String
    
    var body: some View {
        
        Button(
            action: action,
            label: {
                
                Text(self.text)
                    .bold()
                    .foregroundColor(Color.white)
        }
        )
            .frame(width:300,height:50)
            .background(Color.blue)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .cornerRadius(20)
            .padding(20)
        
    }
}

struct Questionnaire_View_Previews: PreviewProvider {
    static var previews: some View {
        Questionnaire_View()
    }
}
