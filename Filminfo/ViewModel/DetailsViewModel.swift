//
//  DetailsViewModel.swift
//  Filminfo
//
//  Created by JonathanTriC on 18/01/23.
//

import Foundation

class DetailsMovieViewModel: ObservableObject {
    let id: Int
    
    @Published var details: MovieDetail? = nil
    
    init(id: Int) {
        self.id = id
        self.loadDetails()
    }
    
    func loadDetails() {
        APIService.get(endpoint: "movie/\(id)") { [weak self] (details: MovieDetail) in
            self?.details = details
        }
    }
}
