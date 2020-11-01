//
//  Movie.swift
//  MoviesDemo
//
//  Created by SOWJI on 01/11/20.
//

import Foundation

@objcMembers class Movie : Decodable {
    dynamic var poster  : String?
    dynamic var name  : String?
    dynamic var genre  = [Int]()
    dynamic var overview  : String?
    dynamic var release_date  : String?
    dynamic var rating  : Double?
    dynamic var backdrop  : String?
    
    
    private enum CodingKeys: String, CodingKey {
        case poster = "poster_path"
        case name = "title"
        case genre = "genre_ids"
        case overview
        case release_date
        case rating = "vote_average"
        case backdrop = "backdrop_path"
    }
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        poster = try values.decodeIfPresent(String.self, forKey: .poster) ?? ""
        poster = API.baseImageURL + (poster ?? "")
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        overview = try values.decodeIfPresent(String.self, forKey: .overview) ?? ""
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date) ?? ""
        backdrop = try values.decodeIfPresent(String.self, forKey: .backdrop) ?? ""
        backdrop = API.baseImageURL + (backdrop ?? "")
        genre = try values.decodeIfPresent([Int].self, forKey: .genre) ?? []
        rating = try values.decodeIfPresent(Double.self, forKey: .rating) ?? 0.0
    }
}
