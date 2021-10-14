//
//  ScoresModel.swift
//  Quiz SwiftUI (iOS)
//
//  Created by Javier García Céspedes on 23/9/21.
//

import Foundation

class ScoresModel: ObservableObject{
    
    @Published private(set) var acertadas: Set<Int> = []
    
    
    func check(respuesta: String, quiz: QuizItem){
        let r1 = respuesta.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let r2 = quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if r1 == r2, !acertadas.contains(quiz.id){
            acertadas.insert(quiz.id)
            
        }
        

    }

}
