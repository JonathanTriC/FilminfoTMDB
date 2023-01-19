//
//  HomeViewModel.swift
//  Filminfo
//
//  Created by JonathanTriC on 18/01/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var rows = [Row]()
    
    private let endpoints: [Endpoint] = [.init(name: "movie/now_playing", title: "Now Playing Movies"), .init(name: "movie/popular", title: "Popular Movies"), .init(name: "movie/top_rated", title: "Top Rated Movies")]
    
    func fetchLists() {
        for endpoint in endpoints {
            APIService.get(endpoint: endpoint.name, parameters: endpoint.parameters) { [weak self] (list: MovieList) in
                self?.rows.append(.init(title: endpoint.title, list: list, endpoint: endpoint.name, parameters: endpoint.parameters))
            }
        }
    }
    
    init() {
        self.fetchLists()
    }
    
    private struct Endpoint {
        let name: String
        let title: String
        let parameters: [String: Any] = [:]
    }
    
    struct Row: Identifiable {
        let id = UUID()
        let title: String
        let list: MovieList
        let endpoint: String
        let parameters: [String: Any]
    }
}
