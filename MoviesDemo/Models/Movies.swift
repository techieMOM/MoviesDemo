//
//  Movies.swift
//  MoviesDemo
//
//  Created by SOWJI on 01/11/20.
//

import Foundation

 class Movies : Decodable {
    var page  : Int = 1
    var total_pages  : Int = 1
    var movies = [Movie]()
    private enum CodingKeys: String, CodingKey {
        case page
        case total_pages
        case movies = "results"
    }
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page) ?? 1
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages) ?? 1
        movies = try values.decodeIfPresent([Movie].self, forKey: .movies) ?? []
    }
}
