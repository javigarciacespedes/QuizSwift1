//
//  QuizzesModel.swift
//  P1 Quiz SwiftUI
//
//  Created by Santiago Pavón Gómez on 17/09/2021.
//

import Foundation

class QuizzesModel: ObservableObject { //Carga el fichero JSON y mete todos los quizzes en el array de quizzes
    
    // Los datos
    @Published private(set) var quizzes = [QuizItem]() //@Published: si algo cambia, cambian todos los datos. Esta variable se puede consultar, pero no se puede cambiar. No se puede acceder desde fuera. 
    
    func load() { //Método que lee el archivo JSON y rellena el Array
                
        guard let jsonURL = Bundle.main.url(forResource: "p1_quizzes", withExtension: "json") else { //Bundle = saco de ficheros
            print("Internal error: No encuentro p1_quizzes.json")
            return
        }
        
        do {
            let data = try Data(contentsOf: jsonURL) //Data = buffer de bytes (String de bytes)
            let decoder = JSONDecoder() //Máquina de decodificar JSON
            
//            if let str = String(data: data, encoding: String.Encoding.utf8) {
//                print("Quizzes ==>", str)
//            }
            
            let quizzes = try decoder.decode([QuizItem].self, from: data)
            
            self.quizzes = quizzes

            print("Quizzes cargados")
        } catch {
            print("Algo chungo ha pasado: \(error)")
        }
    }
}
