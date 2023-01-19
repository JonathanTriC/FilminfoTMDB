//
//  DetailsMovieViews.swift
//  Filminfo
//
//  Created by JonathanTriC on 18/01/23.
//

import SwiftUI

struct DetailsMovieViews: View {
    @StateObject private var viewModel: DetailsMovieViewModel
    init(id: Int) {
        self._viewModel = StateObject(wrappedValue: DetailsMovieViewModel(id: id))
    }
    
    var body: some View {
        ScrollView{
            if let details = viewModel.details {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(details.backdropPath)")) { image in
                        image
                            .resizable()
                            .frame(width: .infinity, height: 260)
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                            .frame(width: .infinity, height: 260)
                            .background(.gray.opacity(0.3))
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack{
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(details.posterPath)")) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height: 130)
                                    .cornerRadius(18)
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 100, height: 130)
                                    .cornerRadius(18)
                                    .background(.gray.opacity(0.3))
                                    .foregroundColor(.white)
                            }
                            .padding(.trailing)
                            
                            VStack(alignment: .leading) {
                                Text(details.originalTitle)
                                    .font(.title)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .multilineTextAlignment(.leading)
                                    .padding(.bottom, 6)
                                
                                Text(details.releaseDate )
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Overview")
                            .font(.title2)
                            .fontWeight(.medium)
                            .padding(.bottom, 8)
                        
                        Text(details.overview)
                            .foregroundColor(.black)
                            .padding(.bottom, 8)
                        
                        HStack{
                            Text("Watch Trailers and Clip")
                                .font(.title2)
                                .fontWeight(.medium)
                            Spacer()
                            NavigationLink(destination: TrailersView(id: details.id)) {
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.vertical)
                        
                        HStack{
                            Text("Reviews")
                                .font(.title2)
                                .fontWeight(.medium)
                            Spacer()
                            NavigationLink(destination: ReviewsView(id: details.id)) {
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.vertical)
                    }
                    .padding(20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .hiddenNavigationBarStyle()
        
    }
}

struct DetailsMovieViews_Previews: PreviewProvider {
    static var previews: some View {
        DetailsMovieViews(id: 315162)
    }
}

