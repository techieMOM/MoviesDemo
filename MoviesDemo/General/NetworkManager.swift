//
//  NetworkManager.swift
//  MoviesDemo
//
//  Created by SOWJI on 01/11/20.
//

import Foundation
import Alamofire

class NetworkManager {
    // Fetch Movies Data
    class func fetchMovies(_ page : Int,completion:@escaping (Movies?)->Void) {
        if let movieURL = URL(string: String(format: API.moviesURL, API.API_TOKEN,page)) {
            AF.request(movieURL).responseJSON(completionHandler: { (response) in
                if let jsonData = response.data {
                    do{
                        let decoder = JSONDecoder()
                        let movie = try decoder.decode(Movies.self, from: jsonData)
                        completion(movie)
                    }catch let err{
                        completion(nil)
                        print(err)
                    }
                }
            })
        }
    }
    
    // Fetch Genres Data
    class func fetchGenres(completion:@escaping ([Genre])->Void) {
        if let genreURL = URL(string: String(format: API.genreURL, API.API_TOKEN)) {
            AF.request(genreURL).responseJSON(completionHandler: { (response) in
                if let jsonData = response.data {
                    do{
                        let decoder = JSONDecoder()
                        let genre = try decoder.decode(Genres.self, from: jsonData)
                        completion(genre.genreData)
                    }catch let err{
                        completion([])
                        print(err)
                    }
                }
            })
        }
    }
    
    // Search Movie
    class func searchMovies(_ text : String,completion:@escaping ([Movie])->Void) {
        if let movieURL = URL(string: String(format: API.searchMovieURL, API.API_TOKEN,text)) {
            print(movieURL)
            AF.request(movieURL).responseJSON(completionHandler: { (response) in
                if let jsonData = response.data {
                    do{
                        let decoder = JSONDecoder()
                        let movie = try decoder.decode(Movies.self, from: jsonData)
                        completion(movie.movies)
                    }catch let err{
                        completion([])
                        print(err)
                    }
                }
            })
        }
    }
}
