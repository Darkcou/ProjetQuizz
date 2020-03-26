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
            Informations(image: "indochine.jpeg",
                         text: "indochine - le troisième sexe",
                         lien: "")),
    
    Questions(sentence: "Dans les années 1920, à quel courant artistique appartenaient les peintres Max Ernst et Salvador Dali ?", responses: [

        Response(sentence: "Le surréalisme", isGoodResponse: true),
        Response(sentence: "Le pointillisme", isGoodResponse: false),
        Response(sentence: "Le cubisme", isGoodResponse: false),
        Response(sentence: "L'impressionisme", isGoodResponse: false)
    ], theme: .art, information:
            Informations(image: "Dali.jpeg",
                         text: "Le surréalisme est un mouvement littéraire et artistique né après la Première Guerre mondiale ; ce mouvement succède au dadaïsme. Le mouvement, défini par André Breton dans le Manifeste du surréalisme publié en 1924, repose sur le refus de toutes les constructions logiques de l’esprit et sur les valeurs de l’irrationnel, de l’absurde, du rêve, du désir et de la révolte.",
                         lien: "https://www.etudes-litteraires.com/surrealisme.php")),
    
    Questions(sentence: "Comment appelle-t-on au Canada l'objet plat et rond servant de balle au hockey sur glace ?", responses: [

        Response(sentence: "La rondelle", isGoodResponse: true),
        Response(sentence: "Le puck", isGoodResponse: false),
        Response(sentence: "Le plat", isGoodResponse: false),
        Response(sentence: "Le palet", isGoodResponse: false)
    ], theme: .sport, information:
            Informations(image: "hockey.jpeg",
                         text: "La rondelle au Canada, Le puck en  en anglais et Le palet en France",
                         lien: "https://fr.wikipedia.org/wiki/Hockey_sur_glace")),
    
    Questions(sentence: "Quelle religieuse a reçu le prix Nobel de la paix en 1979 ?", responses: [

        Response(sentence: "Mère Thérésa", isGoodResponse: true),
        Response(sentence: "Sœur Hildegarde de Bin", isGoodResponse: false),
        Response(sentence: "Mère Geneviève", isGoodResponse: false),
        Response(sentence: "Sœur Marie-Odile", isGoodResponse: false)
    ], theme: .star, information:
            Informations(image: "theresa.jpeg",
                         text: "Mère Teresa en aura en effet épaté plus d'un. Sa vie, sa vocation et son oeuvre parlent pour elle. Parce qu'elle avait reçu, comme un ordre divin, l'appel à se mettre, dans les bidonvilles de Calcutta, au service des misérables et des sans-abris, elle avait quitté, à presque 40 ans, le confort de son monastère. Jusqu'à la fin de ses jours, elle vécut au milieu des sans-abris et des mourants, fondant au fil des années et dans divers pays, des maisons d'accueil pour les plus déshérités.",
                         lien: "https://fr.wikipedia.org/wiki/Mère_Teresa")),
    
    Questions(sentence: "Quel alcool au nom germanique est extrait des cerises ou des merises ?", responses: [

        Response(sentence: "Le Kirsch", isGoodResponse: true),
        Response(sentence: "Le Gin", isGoodResponse: false),
        Response(sentence: "Le Jägermeister", isGoodResponse: false),
        Response(sentence: "Le Heineken", isGoodResponse: false)
    ], theme: .divers, information:
            Informations(image: "merises.jpeg",
                         text: "Les alcools blancs obtenus par distillation de fruits sont très populaires en Allemagne, en Autriche, en Belgique germanophone, au Luxembourg, en France (Alsace, Franche-Comté, Lorraine, Pays de Savoie, Périgord) et en Suisse. Dans les pays et régions germanophones il est considéré comme une forme de schnaps. Le schnaps est l'eau-de-vie obtenue par la distillation de plusieurs fruits. Le kirsch peut être utilisé pour la préparation de la fondue au fromage.",
                         lien: "https://fr.wikipedia.org/wiki/Kirsch")),
    
    Questions(sentence: "Quel inspecteur de police poursuit Jean Valjean dans \"Les Misérables\" ?", responses: [

        Response(sentence: "Javert", isGoodResponse: true),
        Response(sentence: "Columbo", isGoodResponse: false),
        Response(sentence: "Hannibal", isGoodResponse: false),
        Response(sentence: "Starsky", isGoodResponse: false)
    ], theme: .lecture, information:
            Informations(image: "miserables.jpeg",
                         text: "Hugo écrit ce roman sur 17 années, en deux fois diamétralement opposées, à deux moments presque opposés de son évolution personnelle et politique. La première fois, en 1845, il a 43 ans et le livre s’appelle alors Les Misères. Au sommet de sa carrière, académicien, mondain, reçu par le Roi, Hugo est honoré partout. Il vient d’être nommé Pair de France, l’équivalent d’un sénateur, dans le parti de l’ordre, conservateur. Mais il est pris en flagrant délit d’adultère. Sa réputation ternie, le roi lui demande de se faire oublier quelques temps. Dans son bureau de la Place des Vosges, il s’isole et écrit, frénétiquement, sa réponse à la Comédie humaine de Balzac à partir du destin d’un forçat libéré du bagne, Jean Valjean. Jean-Marc Hovasse : Hugo déplace les horaires de repas, il travaille énormément, le matin, l’après-midi, le soir. Il s’enferme dans son roman. Sa documentation, c’est là où c’est troublant, il l’a accumulée depuis des années. Habité par la question sociale depuis longtemps, Hugo fait appel à ses anciennes visites de prisons, de bagnes, d’usines, de villes comme Montfermeil, de rencontres avec des ouvrières, pour écrire au plus près du réel, de la misère. Mais alors qu’il a écrit les trois quarts du récit, survient la révolution de 1848, Hugo arrête tout pour se consacrer à la politique. Élu à l’Assemblée nationale, il tient de grands discours sur le prolétariat, la liberté de la presse, l’éducation... qu’il déclinera plus tard dans son roman.",
                         lien: "https://www.franceculture.fr/litterature/comment-victor-hugo-a-ecrit-les-miserables")),
    
    Questions(sentence: "Quelle planète a été déchue de son rang le 24 août 2006 ?", responses: [

        Response(sentence: "Pluton", isGoodResponse: true),
        Response(sentence: "Europe", isGoodResponse: false),
        Response(sentence: "Ganymède", isGoodResponse: false),
        Response(sentence: "Amalthée", isGoodResponse: false)
    ], theme: .science, information:
            Informations(image: "pluton.jpeg",
                         text: "L’Union astronomique internationale, réunie le 24 août 2006 à Prague, a déchu Pluton de son rang de planète en raison du redéfinition de ce qu'est une planète et désavoué les experts qui voulaient élargir le nombre de planètes du système solaire à douze en y intégrant des planètes naines comme Cérès, Xena ou Charon. Découverte en 1930, Pluton diffère par plusieurs aspects des huit autres planètes du système solaire : elle est formée de glace là où les autres sont rocheuses ou gazeuses ; elle suit en outre une orbite très longue et très excentrée, et met 247 ans pour effectuer une révolution. Elle est en outre très petite (2 300 kilomètres de diamètre), plus petite même que notre bonne vieille Lune. Aujourd’hui, cette décision fait toujours polémique au sein de la communauté scientifique. Dans une étude américaine publiée dans la revue Icarus en août 2018, des chercheurs suggèrent de revoir la définition des planètes. Il faut rappeler au passage que Pluton est un symbole important aux Etats-Unis : c’est la seule planète découverte par un Américain.",
                         lien: "https://www.planete-astronomie.eu/planete-naine-pluton.html")),

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
