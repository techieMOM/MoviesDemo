//
//  MovieViewModel.swift
//  MoviesDemo
//
//  Created by SOWJI on 01/11/20.
//

import UIKit

class MovieViewModel: NSObject {
    var genres = [Genre]()
    var movies = [Movie]()
    var currentPage = 0
    var totalPages = 0
    
    func fetchMovies( completion : @escaping ((Bool) -> (Void))) {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        DispatchQueue.main.async {
            NetworkManager.fetchGenres { (genre) in
                self.genres = genre
                dispatchGroup.leave()
            }
        }
        dispatchGroup.enter()
        DispatchQueue.main.async {
            NetworkManager.fetchMovies(1, completion: { (movie) in
                if let data = movie {
                    self.movies = data.movies
                    self.currentPage = data.page
                    self.totalPages = data.total_pages
                }
                dispatchGroup.leave()
            })
        }
        dispatchGroup.notify(queue: .main) {
            completion(true)
        }
    }
    
    func fetchGenre(_ ids : [Int]) -> String {
        let filteredData = genres.filter { ids.contains($0.id)}
        let genreNames = filteredData.map { $0.name ?? ""}
        return genreNames.joined(separator: ",")
    }
    
    func fetchMoviesOffset(_ page : Int, completion : @escaping (([Movie]) -> (Void))) {
        NetworkManager.fetchMovies(page, completion: { (movie) in
            if let data = movie {
                self.currentPage = data.page
                completion(data.movies)
            }
        })}
}


