//
//  MoviesModelTestCase.swift
//  MoviesDemoTests
//
//  Created by SOWJI on 02/11/20.
//

import XCTest
@testable import MoviesDemo

class MoviesModelTestCase: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMoviesModel() throws {
        // Encoding the instance into Data, then immediately
              // decoding that data back into a new instance:
        do {
            let movies = Movies(page : 1,total_pages : 50,movies : [Movie(poster : "",name : "",genre: [],overview : "",release_date:"",rating:4)])
            let encoder = JSONEncoder()
            let data = try encoder.encode(movies)
            let decoder = JSONDecoder()
            let decodeMovies = try decoder.decode(Movies.self, from: data)
            XCTAssert(movies.total_pages == decodeMovies.total_pages, "Movies Decoded")
        }
        catch {
            
        }
                             
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testMovieModel() throws {
        // Encoding the instance into Data, then immediately
              // decoding that data back into a new instance:
        do {
            let movie = Movie(poster : "",name : "TestMovieModel",genre: [],overview : "",release_date:"02-3-2020",rating:5)
            let encoder = JSONEncoder()
            let data = try encoder.encode(movie)
            let decoder = JSONDecoder()
            let decodeMovies = try decoder.decode(Movie.self, from: data)
            XCTAssert(movie.name == decodeMovies.name, "Movie is Decoded")
        }
        catch {
            
        }
                             
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
