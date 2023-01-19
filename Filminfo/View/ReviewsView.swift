//
//  ReviewsView.swift
//  Filminfo
//
//  Created by JonathanTriC on 18/01/23.
//

import SwiftUI

struct ReviewsView: View {
    @StateObject private var viewModel: ReviewsViewModel
    init(id: Int) {
        self._viewModel = StateObject(wrappedValue: ReviewsViewModel(id: id))
    }
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text("Reviews")
                    .font(.title)
                    .fontWeight(.medium)
                if let reviews = viewModel.reviews?.results {
                    if !reviews.isEmpty {
                        
                        
                        ForEach(reviews, id: \.uuid) { review in
                            VStack(alignment: .leading) {
                                HStack{
                                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(review.authorDetails.avatarPath ?? "")")) { image in
                                        image
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .clipShape(Circle())
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 40, height: 40)
                                            .clipShape(Circle())
                                            .background(.gray.opacity(0.3))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.trailing, 4)
                                    Text(review.authorDetails.name)
                                    Spacer()
                                    
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.yellow)
                                        .padding(.trailing, 4)
                                    Text("\(review.authorDetails.rating ?? 0)")
                                }
                                
                                Text(review.content)
                            }
                            .padding(.bottom)
                        }
                    } else {
                        Text("There is no reviews yet!")
                            .padding(.vertical)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
        }
        .hiddenNavigationBarStyle()
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView(id: 315162)
    }
}
