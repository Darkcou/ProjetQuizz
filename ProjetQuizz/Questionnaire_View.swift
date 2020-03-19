//
//  Questionnaire_View.swift
//  ProjetQuizz
//
//  Created by annecrepin on 17/03/2020.
//  Copyright © 2020 Benjamin Gronier. All rights reserved.
//

import SwiftUI

struct Questionnaire_View: View {
    
    var numQuestion:Int = 1
    var score:Int = 0
    var reponsesList = [question[0].bonneReponse , question[0].mauvaiseRep1, question[0].mauvaiseRep2 , question[0].mauvaiseRep3]
    @State var win:Bool = false
    
    var body: some View {
        
        VStack{
            Text("Score:\(score)")
            Spacer()
            Text("Question \(numQuestion)")
                .font(.system(Font.TextStyle.largeTitle))
                .padding()

            Spacer()
            Text(question[0].question)
                .font(.system(Font.TextStyle.title))
                .bold()
            Spacer()
            
             

            ForEach(reponsesList.shuffled() ,id: \.self) { reponse in

        
                ButtonStyle(action: {
                    
                    // en cours de création donc pas fonctionelle
                    print("\(question[0].bonneReponse)")
                    if reponse == question[0].bonneReponse {
                        self.win = true
                        print("win")
                    }else{
                        self.win = false
                        print("raté")
                    }
                    
                }, text: reponse)

                
            }
            
            Spacer()
            
            Button(
                action: {
                    
            },
                label: {
                    
                    Text("En savoir plus")
                        .bold()
                        .foregroundColor(Color.white)
            }
            )
                .frame(width:150,height:50)
                .background(Color.blue)
                .cornerRadius(20)
                .padding()
            
            
            Button(
                action: {
                    
            },
                label: {
                    
                    Text("Suivant")
                        .bold()
                        .foregroundColor(Color.white)
            }
            )
                .frame(width:150,height:50)
                .background(Color.blue)
                .cornerRadius(20)
            
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
                .cornerRadius(20)
                .padding(20)

    }
}

struct Questionnaire_View_Previews: PreviewProvider {
    static var previews: some View {
        Questionnaire_View()
    }
}
