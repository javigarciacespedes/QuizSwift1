//
//  QuizRowView.swift
//  Quiz SwiftUI
//
//  Created by Javier García Céspedes on 21/9/21.
//

import SwiftUI

struct QuizRowView: View {
    
    var quizItem : QuizItem
    
    
    var body: some View {
        
        let aurl = quizItem.attachment?.url
        let anivm = NetworkImageViewModel(url: aurl)
        
        let uurl = quizItem.author?.photo?.url
        let univm = NetworkImageViewModel(url: uurl)
        
        
        return HStack{
            NetworkImageView(viewModel: anivm)
                .scaledToFill()
                .frame(width: 75, height: 75, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(lineWidth: 2))
            VStack{
                Text(quizItem.question)
                    .font(.headline)
                
                Image(quizItem.favourite ? "star_yellow" : "star_grey")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .scaledToFill()
                HStack(alignment: .bottom, spacing: 5){
                    Spacer()
                    Text(quizItem.author?.username ?? "Anónimo")
                        .font(.callout)
                        .foregroundColor(.green)
                    
                    NetworkImageView(viewModel: univm)
                        .scaledToFill()
                        .frame(width: 30, height: 30, alignment: .center)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(lineWidth: 3))
                }
            }
            
        }
    }
}

//struct QuizRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizRowView()
//    }
//}
