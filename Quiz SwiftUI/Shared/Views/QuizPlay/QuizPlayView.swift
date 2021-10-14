//
//  QuizPlayView.swift
//  Quiz SwiftUI (iOS)
//
//  Created by Javier García Céspedes on 23/9/21.
//

import SwiftUI

struct QuizPlayView: View {
    var quizItem : QuizItem
    
    @EnvironmentObject var scoresModel: ScoresModel //asigna el enviroment a este valor
    
    
    @State var answer: String = ""
    @State var showAlert  = false
    @State var showSolution = false
    
    var body: some View {
        
        return VStack{
            HStack{
                Text(quizItem.question)
                    .font(.largeTitle)
                Image(quizItem.favourite ? "star_yellow" : "star_grey")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFit()
            }
            VStack{
                TextField("Respuesta",
                          text:$answer,
                          onCommit: {
                    showAlert = true
                }
                )
                    .alert(isPresented: $showAlert) {
                        scoresModel.check(respuesta: answer, quiz: quizItem)
                        let r1 = answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                        let r2 = quizItem.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                        return Alert(title: Text("Resultado"),
                                     
                                     message: Text(r1==r2 ? "Respuesta Correcta" : "Respuesta Incorrecta"),
                                     dismissButton: .default(Text("Volver")))
                        
                    }
            }.padding()
            
            Button {
                showAlert = true
            } label: {
                Text("Comprobrar")
            }
            
            attachment
            solution
            author
            
            Text("Score: \(scoresModel.acertadas.count)")
            
            
        }
        
    }
    
    private var author: some View{
        let uurl = quizItem.author?.photo?.url
        let univm = NetworkImageViewModel(url: uurl)
        
        return HStack(alignment: .bottom, spacing: 5){
            Text(quizItem.author?.username ?? "Anónimo")
                .font(.callout)
                .foregroundColor(.green)
            
            NetworkImageView(viewModel: univm)
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(lineWidth: 3))
        }
    }
    
    private var attachment: some View{
        
        let aurl = quizItem.attachment?.url
        let anivm = NetworkImageViewModel(url: aurl)
        
        return GeometryReader { g in
            NetworkImageView(viewModel: anivm)
                .scaledToFill()
                .frame(width: g.size.width, height: g.size.height, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .contentShape(RoundedRectangle(cornerRadius: 10)) //importante para los giros de pantalla
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                .saturation(self.showAlert ? 0.1 : 1)
                .animation(.easeInOut, value: self.showAlert)
        }
        .padding()
    }
    
    private var solution: some View{
        
        VStack{
            Button {
                showSolution = true
            } label: {
                Text("Mostrar Solucion")
            }
                .alert(isPresented: $showSolution) {
                    return Alert(title: Text("Solución"),
                                 message: Text(quizItem.answer),
                                 dismissButton: .default(Text("Volver"))
)
                    
                }
        }
      //  .padding()
    }
}
//    struct QuizPlayView_Previews: PreviewProvider {
//        static var previews: some View {
//            QuizPlayView()
//        }
//    }
