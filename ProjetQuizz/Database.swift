//
//  Database.swift
//  MySwiftUI
//
//  Created by AxelGilbin on 16/03/2020.
//  Copyright © 2020 AxelGilbin. All rights reserved.
//

import Foundation

enum Theme {
    
    case cinema , art , musique , jeux , science , lecture , sport , histoire , voyage , nature , star , divers
}

struct Questions{
    
    let question:String
    let bonnereponse:String
    let mauvaiseRep1:String
    let mauvaiseRep2:String
    let mauvaiseRep3:String
    let theme:Theme
    let reponse:Reponses
    
}

var question: [Questions] = [Questions(question: "En combien de temps s'est construite la tour Eiffel", bonnereponse: "2 ans", mauvaiseRep1: "5 ans", mauvaiseRep2: "10 ans", mauvaiseRep3: "13 ans", theme: .histoire , reponse: <#T##<<error type>>#>)]

struct Iformation {
    
    let id:Int
    let image:String
    let text:String
    let lien:String
}

var iformation:[Iformation] = [Iformation(id: , image: "eiffel.jpeg", text: "blablabla \r  blablabla", lien: "www.eiffel.com")]


    
    
}
