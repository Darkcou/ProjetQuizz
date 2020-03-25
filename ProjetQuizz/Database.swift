//
//  Database.swift
//  MySwiftUI
//
//  Created by AxelGilbin on 16/03/2020.
//  Copyright © 2020 AxelGilbin. All rights reserved.
//

import Foundation

/************************ Thème ********************************************/

enum Theme: String, CaseIterable {
    
    case cinema = "Cinema"
    case art = "Art"
    case musique = "Musique"
    case jeux = "Jeux"
    case science = "Science"
    case lecture = "Lecture"
    case sport = "Sport"
    case histoire = "Histoire"
    case voyage = "Voyage"
    case nature = "Nature"
    case star = "Star"
    case divers = "Divers"
}

struct ThemeSelect: Identifiable {
    let id = UUID()
    let name:String
    let type:Theme
    var isSelect:Bool = false
    
    init(theme: Theme) {
        self.name = theme.rawValue
        self.type = theme
    }
    
    mutating func IsSelect(newSelect:Bool){
        self.isSelect = newSelect
    }
}

func ThemeList()->[ThemeLine]{
    let themeAll = Theme.allCases.map{ theme in ThemeSelect.init(theme: theme)}
    var themeLine:[ThemeSelect] = []
    var themeListing:[ThemeLine] = []
    
    for theme in themeAll
    {
        themeLine.append(theme)
        if(themeLine.count) % 3 == 0{
            themeListing.append(ThemeLine(themes: themeLine))
            themeLine.removeAll()
        }
    }
    return themeListing
}

struct ThemeLine: Identifiable {
    let id = UUID()
    var themes: [ThemeSelect]
    
    func NSelect() -> Int {
        var nSelect = 0
        for theme in self.themes{
            if theme.isSelect == true {
                nSelect += 1
            }
        }
        return nSelect
    }
    
    mutating func AllClick() {
        for idx in 0..<themes.count {
            if(themes[idx].isSelect == true){
                themes[idx].isSelect = false
            }
            else{
                themes[idx].isSelect = true
            }
        }
    }
    
    func DonneTheme() -> [Theme] {
        var themeSelect:[Theme] = []
        for idx in 0..<themes.count {
            if(themes[idx].isSelect == true){
                themeSelect.append(themes[idx].type)
            }
        }
        return themeSelect
    }
    
}

/************************ Questions ********************************************/
struct Questions {
    let sentence : String
    let responses : [Response]
    let theme:Theme
    let information:Informations

}

struct Response:Identifiable {
    let id = UUID()
    let sentence: String
    let isGoodResponse: Bool
}

struct Informations {
    
    let image:String
    let text:String
    let lien:String
}

let question : [Questions] = [

    Questions(sentence: "En combien de temps a été construite la tour Eiffel ?", responses: [

        Response(sentence: "En 2 ans", isGoodResponse: true),
        Response(sentence: "En 7 ans", isGoodResponse: false),
        Response(sentence: "En 10 ans", isGoodResponse: false),
        Response(sentence: "En 13 ans", isGoodResponse: false)
    ], theme: .histoire, information:
            Informations(image: "eiffel.jpeg",
                         text: "La tour Eiffel a été construite par Gustave Eiffel à l’occasion de l’Exposition Universelle de 1889 qui célébrait le premier centenaire de la Révolution française.Sa construction en 2 ans, 2 mois et 5 jours, fut une véritable performance technique et architecturale.",
                         lien: "www.eiffel.com")),
       
    Questions(sentence: "En quelle année a été fondé Nintendo ?", responses: [

        Response(sentence: "En 1889", isGoodResponse: true),
        Response(sentence: "En 1953", isGoodResponse: false),
        Response(sentence: "En 1923", isGoodResponse: false),
        Response(sentence: "En 1969", isGoodResponse: false)
    ], theme: .jeux, information:
            Informations(image: "nintendo.jpeg",
                         text: "Créée le 23 septembre 1889, Nintendo se nomme d’abord Nintendo Koppaï. Il ne s’agit que d’une petite entreprise artisanale que Fusajiro Yamauchi a créée pour vendre des cartes à jouer, les hanafuda, qu’il avait fabriquées lui-même.",
                         lien: "https://www.nintendo.fr/Societe/L-Histoire-de-Nintendo/L-Histoire-Nintendo-625945.html#1889")),
    
    Questions(sentence: "Que fait la mante religieuse après l'accouplement ?", responses: [

        Response(sentence: "Elle dévore le mâle", isGoodResponse: true),
        Response(sentence: "Elle cherche un abri", isGoodResponse: false),
        Response(sentence: "Elle recommence", isGoodResponse: false),
        Response(sentence: "Elle cherche un autre partenaire", isGoodResponse: false)
    ], theme: .nature, information:
            Informations(image: "manthe.jpeg",
                         text: "Et oui, cela peut arriver que madame dévore monsieur pendant la saison des amours, en fin d'été (août à octobre). Mais uniquement si elle a faim. La femelle commence à dévorer la tête du mâle, qui fait en moyenne 2 à 3 cm de moins qu'elle, pendant qu'elle continue de s'accoupler avec lui.",
                         lien: "https://www.geo.fr/environnement/tout-ce-quil-faut-savoir-sur-la-mante-religieuse-199207")),
    
    Questions(sentence: "Dans quel pays pouvez-vous visiter le temple de Louxor ?", responses: [

        Response(sentence: "En Egypte", isGoodResponse: true),
        Response(sentence: "En Inde", isGoodResponse: false),
        Response(sentence: "En France", isGoodResponse: false),
        Response(sentence: "En Grèce", isGoodResponse: false)
    ], theme: .voyage, information:
            Informations(image: "louxor.jpeg",
                         text: "Louxor se situe sur les rives du Nil. Visiter Louxor est une étape inévitable lors d’un voyage en Egypte. C’est très souvent le point de départ d’une croisière sur le Nil mais aussi et surtout la première étape de la découverte de la vallée du Nil.",
                         lien: "https://www.voyageway.com/visiter-louxor-egypte")),
    
    Questions(sentence: "Dans Astérix et Obélix : Mission Cléopâtre, qui incarne Numérobis ?", responses: [

        Response(sentence: "Jamel Debbouze ", isGoodResponse: true),
        Response(sentence: "Christian Clavier", isGoodResponse: false),
        Response(sentence: "Omar Sy", isGoodResponse: false),
        Response(sentence: "Gérard Depardieu", isGoodResponse: false)
    ], theme: .cinema, information:
            Informations(image: "jamel.jpeg",
                         text: "Astérix et Obélix : Mission Cléopâtre est un film français réalisé par Alain Chabat, sorti en 2002. Il s'agit d'une adaptation de la bande dessinée Astérix et Cléopâtre (1963) de René Goscinny et Albert Uderzo.",
                         lien: "https://fr.wikipedia.org/wiki/Astérix_et_Obélix_:_Mission_Cléopâtre")),
    
    Questions(sentence: "Quel groupe a chanté \" Troisième Sexe \" en 1985 ?", responses: [

        Response(sentence: "Indochine", isGoodResponse: true),
        Response(sentence: "Telephone", isGoodResponse: false),
        Response(sentence: "Placebo", isGoodResponse: false),
        Response(sentence: "Les Beatles", isGoodResponse: false)
    ], theme: .musique, information:
            Informations(image: "",
                         text: "indochine - le troisième sexe",
                         lien: "")),
    
    Questions(sentence: "Dans les années 1920, à quel courant artistique appartenaient les peintres Max Ernst et Salvador Dali ?", responses: [

        Response(sentence: "Le surréalisme", isGoodResponse: true),
        Response(sentence: "Le pointillisme", isGoodResponse: false),
        Response(sentence: "Le cubisme", isGoodResponse: false),
        Response(sentence: "L'impressionisme", isGoodResponse: false)
    ], theme: .art, information:
            Informations(image: "",
                         text: "le surréalisme",
                         lien: "")),
    
    Questions(sentence: "Comment appelle-t-on au Canada l'objet plat et rond servant de balle au hockey sur glace ?", responses: [

        Response(sentence: "La rondelle", isGoodResponse: true),
        Response(sentence: "Le puck", isGoodResponse: false),
        Response(sentence: "Le plat", isGoodResponse: false),
        Response(sentence: "Le palet", isGoodResponse: false)
    ], theme: .sport, information:
            Informations(image: "",
                         text: "La rondelle",
                         lien: "")),
    
    Questions(sentence: "Quelle religieuse a reçu le prix Nobel de la paix en 1979 ?", responses: [

        Response(sentence: "Mère Thérésa", isGoodResponse: true),
        Response(sentence: "", isGoodResponse: false),
        Response(sentence: "", isGoodResponse: false),
        Response(sentence: "", isGoodResponse: false)
    ], theme: .star, information:
            Informations(image: "",
                         text: "",
                         lien: "")),
    
    Questions(sentence: "Quel alcool au nom germanique est extrait des cerises ou des merises ?", responses: [

        Response(sentence: "Le kirsch", isGoodResponse: true),
        Response(sentence: "", isGoodResponse: false),
        Response(sentence: "", isGoodResponse: false),
        Response(sentence: "", isGoodResponse: false)
    ], theme: .divers, information:
            Informations(image: "",
                         text: "",
                         lien: "")),
    
    Questions(sentence: "Quel inspecteur de police poursuit Jean Valjean dans \"Les Misérables\" ?", responses: [

        Response(sentence: "Javert", isGoodResponse: true),
        Response(sentence: "", isGoodResponse: false),
        Response(sentence: "", isGoodResponse: false),
        Response(sentence: "", isGoodResponse: false)
    ], theme: .lecture, information:
            Informations(image: "",
                         text: "",
                         lien: "")),
    
    Questions(sentence: "Quelle planète a été déchue de son rang le 24 août 2006 ?", responses: [

        Response(sentence: "Pluton", isGoodResponse: true),
        Response(sentence: "", isGoodResponse: false),
        Response(sentence: "", isGoodResponse: false),
        Response(sentence: "", isGoodResponse: false)
    ], theme: .science, information:
            Informations(image: "",
                         text: "",
                         lien: "")),

]

/************************ User ********************************************/

struct Users{
    
    let name:String
    var ratio:Double
    var badge:[Badges] = []
}

var user: [Users] = [Users(name: "UserTest", ratio: 0)]

struct Badges {
    
    let logo:String
    let description:String
}

var badge : [Badges] = [Badges(logo: "heart.fill", description: "Première utilisation de l'application :) !"), Badges(logo: "tortoise.fill", description: "Champion du theme Nature !")]
