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
    
    @State var colorButton = Color.white
    @State var colorNext = Color.gray

    
    func validationColor(reponse:Response){
        
        if reponse.isGoodResponse == true{
            
            self.colorButton = Color.green
            self.colorNext = Color.blue
            self.win = true

            
        }else{
            self.colorButton = Color.red
            self.colorNext = Color.blue
            self.win = false


        }
    }


    
    @State var win:Bool = false
    
    @State var infoView = false
    @State var scoreView = false

    
    var body: some View {
               
        VStack{
            
            HStack{
                
                Text("Score:\(score)")
                
                Spacer()

                NavigationLink(destination: Score(score: self.score), isActive: $scoreView ){
                    EmptyView()
                }
                // Quit Button
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

            }
            .padding()
            
            Text("Question \(numQuestion)")
                .font(.system(Font.TextStyle.largeTitle))
            
            Spacer()
            
            Text(questionPosée.sentence)
                .font(.system(Font.TextStyle.title))
                .bold()
            
            
            Spacer()
            
            //Reponses List
            ForEach(questionPosée.responses.shuffled()) { reponse in
                
                
                ButtonStyle(action: {
                    
                    self.validationColor(reponse: reponse)
                    
                }, text: reponse.sentence).background(self.colorButton)
                
                
            }
            
            Spacer()
            
            NavigationLink(destination: InformationScreen(info: questionPosée.information), isActive: $infoView ){
                
                EmptyView()
                
            }
            // Info Button
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
                .background(self.colorNext)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
                .padding()
                        
            
            // Next Button
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
                .background(self.colorNext)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            
        }
            .navigationBarTitle("")
            .onAppear(){
                self.generateQuestion()
            }
//            .navigationBarHidden(true)
            .background(self.colorButton)

    }
    
    func generateQuestion() {
        if themeQuestion.isEmpty{
            
            self.colorButton = Color.white
            self.colorNext = Color.gray


            self.questionPosée = question.randomElement()!
            
        }else{
            
            self.colorButton = Color.white
            self.colorNext = Color.gray


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
