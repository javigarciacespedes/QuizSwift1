//
//  Quiz_SwiftUIApp.swift
//  Shared
//
//  Created by Javier García Céspedes on 21/9/21.
//

import SwiftUI

@main
struct Quiz_SwiftUIApp: App {
    
    let quizzesModel = QuizzesModel() //instancia de los QuizzesModel
    let scoresModel = ScoresModel() //instancia de los ScoresModel
    
    
    var body: some Scene {
        WindowGroup {
            QuizzesListView()
                .environmentObject(quizzesModel)//QuizzesListView y sus hijas tendrán siempre el dato QuizzesModel para usarse
                .environmentObject(scoresModel)//QuizzesListView y sus hijas tendrán siempre el dato ScoresModel para usarse(la clase en este caso)
        }
    }
}
