//
//  Questionnaire_View.swift
//  ProjetQuizz
//
//  Created by annecrepin on 17/03/2020.
//  Copyright © 2020 Benjamin Gronier. All rights reserved.
//

import SwiftUI

struct Questionnaire_View: View {
    
    var themeQuestion:[Theme]
    
    @State var numQuestion:Int = 1
    @State var score:Int = 0
    
    @State var questionPosée = question.randomElement()!
    
    @State var win:Bool = false
    
    @State var infoView = false
    @State var scoreView = false

    
    var body: some View {
               
        VStack{
            HStack{
                
                Text("Score:\(score)")
                
                NavigationLink(destination: Score(score: self.score), isActive: $scoreView ){
                    EmptyView()
                }
                Spacer()
                Button(
                    action: {
                        
                        if self.win == true {
                            self.score += 100
                            self.win = false
                        }else{}
                        
                        self.scoreView = true
                    },
                    label: {
                        
                        Image(systemName: "clear.fill")
                            .resizable()
                            .foregroundColor(.red)
                    }
                )
                .frame(width:50,height:50)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)

            }.padding()
            
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
                        self.generateQuestion()

                    }else{
                        self.generateQuestion()
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
        .navigationBarTitle("Question",displayMode: .inline)
        .onAppear(){
            self.generateQuestion()
        }
        .navigationBarHidden(true)

    }
    
    func generateQuestion() {
        if themeQuestion.isEmpty{
            
            self.questionPosée = question.randomElement()!
            
        }else{
            self.questionPosée = question.filter{ question in
                self.themeQuestion.contains(question.theme)
            }.randomElement()!
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
        Questionnaire_View(themeQuestion:[.nature])
    }
}
