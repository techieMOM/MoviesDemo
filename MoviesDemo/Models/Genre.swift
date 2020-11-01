//
//  Genre.swift
//  MoviesDemo
//
//  Created by SOWJI on 01/11/20.
//

import Foundation

class Genres : Decodable {
    var genreData = [Genres]()
    private enum CodingKeys: String, CodingKey {
        case genreData = "genres"
    }
}
 class Genre : Decodable {
     var id  : Int = 0
     var name  : String?
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
}
