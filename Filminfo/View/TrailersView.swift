//
//  TrailersView.swift
//  Filminfo
//
//  Created by JonathanTriC on 19/01/23.
//

import SwiftUI
import YouTubePlayerKit

struct TrailersView: View {
    @StateObject private var viewModel: TrailersViewModel
    init(id: Int) {
        self._viewModel = StateObject(wrappedValue: TrailersViewModel(id: id))
    }
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text("Trailer and Clip")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.horizontal)
                
                if let videos = viewModel.videos?.results.reversed() {
                    ForEach(videos, id: \.uuid) { video in
                        VStack(alignment: .leading) {
                            
                            Text(video.type)
                                .font(.headline)
                                .padding(.vertical, 6)
                            
                            YouTubePlayerView(YouTubePlayer(stringLiteral: "https://youtube.com/watch?v=\(video.key)")) { state in
                                switch state {
                                case .idle:
                                    ProgressView()
                                case .ready:
                                    EmptyView()
                                case .error(_):
                                    Text(verbatim: "YouTube player couldn't be loaded")
                                }
                            }
                            .frame(width: .infinity, height: 260)
                            
                            Text(video.name)
                                .padding(.top)
                            
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .hiddenNavigationBarStyle()
        
    }
}

struct TrailersView_Previews: PreviewProvider {
    static var previews: some View {
        TrailersView(id: 315162)
    }
}
