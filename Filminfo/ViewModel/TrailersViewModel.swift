//
//  TrailersViewModel.swift
//  Filminfo
//
//  Created by JonathanTriC on 19/01/23.
//

import Foundation

class TrailersViewModel: ObservableObject {
    let id: Int
    
    @Published var videos: MovieVideo? = nil
    
    init(id: Int) {
        self.id = id
        self.loadDetails()
    }
    
    func loadDetails() {
        APIService.get(endpoint: "movie/\(id)/videos") { [weak self] (videos: MovieVideo) in
            self?.videos = videos
        }
    }
}
