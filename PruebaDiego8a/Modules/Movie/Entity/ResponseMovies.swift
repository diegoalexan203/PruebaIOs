//
//  ResponseMovies.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 11/04/21.
//

import Foundation

struct ResponseMovies: Decodable {
    var page: Int?
    var movies: [MoviesEntity]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case movies = "results"
    }
    
    init(page: Int?, movies: [MoviesEntity]?,totalPages: Int?, totalResults: Int? ) {
        self.page = page
        self.movies = movies
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}
