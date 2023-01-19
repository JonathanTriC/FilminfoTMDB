//
//  NowPlayingList.swift
//  Filminfo
//
//  Created by JonathanTriC on 18/01/23.
//

import SwiftUI

struct HomeMovieList: View {
    let title: String
    let results: [MovieResult]
    let endpoint: String
    let params: [String: Any]
    
    var body: some View {
        if !results.isEmpty {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.vertical)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 14) {
                        ForEach(results.prefix(7), id: \.uuid) { result in
                            MovieCards(results: result)
                        }
                    }
                }
            }
        }
    }
}

