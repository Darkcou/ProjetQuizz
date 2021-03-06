
//
//  Theme.swift
//  ProjetQuizz
//
//  Created by Benjamin Gronier on 17/03/2020.
//  Copyright © 2020 Benjamin Gronier. All rights reserved.
//

import SwiftUI


struct ThemeView: View {
    @State var loginView = false
    @State var questionView = false
    @State var creerView = false
    @State var nThemeSelect = 0
    @State var themeList:[ThemeLine] = ThemeList()
    @State var themeQuestion:[Theme]=[]
    func ThisColor(isSelect:Bool, t:Color = Color.white, f:Color = Color.black) -> Color {
        return isSelect == true ? t : f
    }
    
    var body: some View {
        
        NavigationView{
 
            VStack{
                
                VStack{
                    
                    HStack{
                        
                        Spacer().frame(width:10)
                        
                        HStack{
                            
                            NavigationLink(destination: CreerQuestionView(), isActive: $creerView ){EmptyView()}
                            
                            Button(action: {
                                self.creerView = true
                            }) {
                                Image("Creer").resizable().foregroundColor(Color.blue).frame(width:40, height: 40).padding().frame(width:50, height: 50)
                                
                            }.buttonStyle(PlainButtonStyle())
                            
                            Text("Proposer une question !").foregroundColor(Color.gray)
                            
                        }.padding(.horizontal)  .background(Color.white).border(Color.gray, width: 2).cornerRadius(10)
                        
                        Spacer().frame(width:25 )
                        
                        VStack{
                            
                            Spacer().frame(height:10)
                            
                            ZStack{
                                
                                NavigationLink(destination: test(), isActive: $loginView ){EmptyView()}
                                
                                Button(action: {
                                    self.loginView = true
                                }) {
                                    Circle().fill(Color.white).frame(width:65, height: 65); Image("Login").resizable().frame(width:25, height: 10)
                                    
                                }.buttonStyle(PlainButtonStyle())
                                
                            }
                            Text("Invité").font(.footnote).frame(height:4)
                            
                        }
                        
                        Spacer().frame(width:10)
                        
                    }
                    
                    Text("Tester votre Qi :Quizz intelligence").foregroundColor(Color.white)
                }.background(Color.blue).cornerRadius(10)
                
                Spacer().frame(height:30)
                
                VStack{
                    
                    Text("\(nThemeSelect)/12 theme selectionné")
                    
                    VStack{
                        themeListView()
                        
                    }.padding(.all)
                }.border(Color.black, width: 2).cornerRadius(5)
                
                Spacer().frame(height: 30)
                Text("")
                HStack{
                    
                    Button(action: {
                        self.themeQuestion.removeAll()
                        self.nThemeSelect = 0
                        for idx in 0..<self.themeList.count {
                            self.themeList[idx].AllClick()
                            self.themeQuestion = self.themeQuestion + self.themeList[idx].DonneTheme()
                            self.nThemeSelect = self.nThemeSelect + self.themeList[idx].NSelect()
                        }
                        
                    }) {
                        VStack{
                            
                            Text("Thème(s)")
                            Text("séléctionné")
                        }.padding(.horizontal).background(Color.blue).cornerRadius(10).foregroundColor(Color.white)
                        
                        
                        
                    }.buttonStyle(PlainButtonStyle())
                    
                    
                    
                    Spacer().frame(width: 100)
                    NavigationLink(destination: Questionnaire_View(themeQuestion: self.themeQuestion), isActive: $questionView ){EmptyView()}
                    
                    Button(action: {
                        self.questionView = true
                    }) {
                        Text("Go").padding(.all).background(Color.green).border(Color.green, width: 4).cornerRadius(100).foregroundColor(Color.white)
                        
                    }.buttonStyle(PlainButtonStyle())
                }
                
            }.navigationBarTitle("Selectionner les thèmes",displayMode: .inline)
        }
        
    }
    
    func themeListView() -> some View {
        self.nThemeSelect = 0
        return ForEach(0..<themeList.count, id: \.self){ idx in
            self.subthemeListView(themeLineIdx: idx, themeLine: self.themeList[idx])
        }
    }
    
    func subthemeListView(themeLineIdx: Int, themeLine: ThemeLine) -> some View {
       return HStack {
            ForEach(0..<themeLine.themes.count, id: \.self){ idx in
                self.themeLineView(themeLineIdx: themeLineIdx, themeSelect: themeLine.themes[idx], idx: idx)
            }
        }
    }
    
    func themeLineView(themeLineIdx: Int, themeSelect: ThemeSelect, idx: Int) -> some View {
        Button(action: {
            self.toggleThemeSelection(isSelected: !themeSelect.isSelect, themeLineIdx: themeLineIdx, themeSelectIdx: idx)
            if themeSelect.isSelect != true{
                self.nThemeSelect = self.nThemeSelect + 1
                self.themeQuestion.append(themeSelect.type)
            }
            else{
                self.nThemeSelect = self.nThemeSelect - 1

                self.themeQuestion.removeAll{ questionTheme in questionTheme
                    == themeSelect.type }

            }
            
        }) {
            VStack {
                Image(themeSelect.name).resizable().renderingMode(.original).frame(width:65, height: 65)
                Text(themeSelect.name)
                    .font(.footnote)
                    .foregroundColor(self.ThisColor(isSelect: themeSelect.isSelect))
                
            }.background(self.ThisColor(isSelect: themeSelect.isSelect,t:Color.blue , f: Color.white)).cornerRadius(10)
            
            if (idx + 1) % 3 != 0 {
                Spacer().frame(width:30)
            }
        }
    }
    
    func toggleThemeSelection(isSelected: Bool, themeLineIdx: Int, themeSelectIdx: Int) {
        themeList[themeLineIdx].themes[themeSelectIdx].isSelect = isSelected
    }
}


struct Theme_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}
