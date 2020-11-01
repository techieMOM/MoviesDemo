//
//  Movie.swift
//  MoviesDemo
//
//  Created by SOWJI on 01/11/20.
//

import Foundation

class Movie : Codable {
    var poster  : String?
    var name  : String?
    var genre  = [Int]()
    var overview  : String?
    var release_date  : String?
    var rating  : Double?
    var genres : String?
    
    private enum CodingKeys: String, CodingKey {
        case poster = "poster_path"
        case name = "title"
        case genre = "genre_ids"
        case overview
        case release_date
        case rating = "vote_average"
    }
    init(poster : String,name : String,genre : [Int],overview : String,release_date : String,rating : Double) {
        self.poster = poster
        self.name = name
        self.genre = genre
        self.overview = overview
        self.release_date = release_date
        self.rating = rating
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        poster = try values.decodeIfPresent(String.self, forKey: .poster) ?? ""
        poster = API.baseImageURL + (poster ?? "")
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        overview = try values.decodeIfPresent(String.self, forKey: .overview) ?? ""
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date) ?? ""
        genre = try values.decodeIfPresent([Int].self, forKey: .genre) ?? []
        rating = try values.decodeIfPresent(Double.self, forKey: .rating) ?? 0.0
    }
}
