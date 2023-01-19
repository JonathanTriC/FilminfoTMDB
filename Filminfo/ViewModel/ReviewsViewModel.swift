//
//  ReviewsViewModel.swift
//  Filminfo
//
//  Created by JonathanTriC on 19/01/23.
//

import Foundation

class ReviewsViewModel: ObservableObject {
    let id: Int
    
    @Published var reviews: MovieReview? = nil
    
    init(id: Int) {
        self.id = id
        self.loadDetails()
    }
    
    func loadDetails() {
        APIService.get(endpoint: "movie/\(id)/reviews") { [weak self] (reviews: MovieReview) in
            self?.reviews = reviews
        }
    }
}
