//
//  ResponseMovies.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 11/04/21.
//

import Foundation

struct ResponseMovies: Encodable {
    var page: Int?
    var movies: [MoviesEntity]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case movies
    }
    
    init(page: Int?, movies: [MoviesEntity]?,totalPages: Int?, totalResults: Int? ) {
        self.page = page
        self.movies = movies
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}
extension ResponseMovies: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let page = try values.decode(String.self, forKey: .page)
        let totalPages  = try values.decode(Int.self, forKey: .totalPages)
        let totalResults  = try values.decode(Int.self, forKey: .totalResults)
        let movies  = try values.decode([MoviesEntity].self, forKey: .movies)
        // Decode to `Location` struct, and then convert back to `CLLocation`.
        // It's very tricky
      
    }
}
