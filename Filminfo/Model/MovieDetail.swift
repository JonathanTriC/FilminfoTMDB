//
//  MovieDetail.swift
//  Filminfo
//
//  Created by JonathanTriC on 18/01/23.
//
import Foundation

// MARK: - MovieDetail
struct MovieDetail: Codable {
    let backdropPath: String
    let id: Int
    let originalTitle, overview, posterPath, releaseDate: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}
