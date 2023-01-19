//
//  MovieCards.swift
//  Filminfo
//
//  Created by JonathanTriC on 18/01/23.
//

import SwiftUI

struct MovieCards: View {
    let results: MovieResult
    
    var body: some View {
        NavigationLink(destination: DetailsMovieViews(id: results.id)){
            VStack{
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(results.posterPath)")) { image in
                    image
                        .resizable()
                        .frame(width: 150, height: 180)
                        .cornerRadius(18)
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                        .frame(width: 150, height: 180)
                        .cornerRadius(18)
                        .background(.gray.opacity(0.3))
                        .foregroundColor(.white)
                }
                Text(results.originalTitle)
                    .frame(width: 150, height: 60)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.black)
                    .padding(.vertical)
            }
        }
    }
}

//struct MovieCards_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieCards()
//    }
//}
