//
//  MovieEntity.swift
//  PruebaDiego8a
//
//  Created by Diego Ochoa on 11/04/21.
//

import Foundation

public class MoviesEntity: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage, originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
           case adult
           case backdropPath = "backdrop_path"
           case genreIDS = "genre_ids"
           case id
           case originalLanguage = "original_language"
           case originalTitle = "original_title"
           case overview, popularity
           case posterPath = "poster_path"
           case releaseDate = "release_date"
           case title, video
           case voteAverage = "vote_average"
           case voteCount = "vote_count"
       }
}


