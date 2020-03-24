
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
    @State var themeSelect = 0
    @State var themeList:[ThemeLine] = ThemeList()
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
                                self.creerView = false
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
                    
                    Text("Sélectionner un ou plusieurs themes !").foregroundColor(Color.white)
                }.background(Color.blue).cornerRadius(10)
                
                Spacer().frame(height:30)
                
                VStack{
                    
                    Text("\(themeSelect)/15 theme selectionné")
                    
                    VStack{
                        
                        ForEach(themeList) { themeLine in
                            HStack {
                                ForEach(0..<themeLine.themes.count, id: \.self){ idx in
                                    Button(action: {
                                        if themeLine.themes[idx].isSelect == true {
//                                            themeLine.themes[idx].IsSelect(newSelect: false)
//                                        }
//                                        else { themeLine.themes[idx].IsSelect(newSelect: true)
                                            
                                        }
                                        self.themeSelect = themeLine.NSelect()
                                        
                                    }) {
                                        VStack {
                                            Image(themeLine.themes[idx].name).resizable().frame(width:65, height: 65)
                                            Text(themeLine.themes[idx].name)
                                                .font(.footnote)
                                                .foregroundColor(self.ThisColor(isSelect: themeLine.themes[idx].isSelect))
                                            
                                            if idx % 2 != 0 {
                                                Spacer().frame(width:30)
                                            }
                                        }.background(self.ThisColor(isSelect: themeLine.themes[idx].isSelect,t:Color.blue , f: Color.white)).cornerRadius(10)
                                        
                                        
                                    }
                                    
                                }
                            }
                        }
                        
                        
                        
                        
                    }.padding(.all)
                }.border(Color.black, width: 2).cornerRadius(5)
                
                Spacer().frame(height: 30)
                
                HStack{
                    
                        
                        VStack{
                            
                            Text("Thème(s)")
                            Text("séléctionné")
                        }.padding(.horizontal).background(Color.blue).cornerRadius(10).foregroundColor(Color.white)
                        
                    
                    
                    
                    Spacer().frame(width: 100)
                    NavigationLink(destination: Questionnaire_View(), isActive: $questionView ){EmptyView()}
                    
                    Button(action: {
                        self.questionView = true
                    }) {
                        Text("Go").padding(.all).background(Color.green).border(Color.green, width: 4).cornerRadius(100).foregroundColor(Color.white)
                        
                    }.buttonStyle(PlainButtonStyle())
                }
                
            }
        }
    }
}


struct Theme_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}
