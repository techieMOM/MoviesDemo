//
//  MoviesVMTests.swift
//  MoviesDemoTests
//
//  Created by SOWJI on 01/11/20.
//

import XCTest
@testable import MoviesDemo

class MoviesVMTests: XCTestCase {
    let movieVM = MovieViewModel()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchMovies() throws {
        movieVM.fetchMovies { (isSuccess) -> (Void) in
            XCTAssert(isSuccess, "Movies List Fetched")
        }
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testFetchGenres() throws {
        XCTAssert(movieVM.fetchGenre([28,3]).isEmpty, "Generes Data fetched from IDs")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testSearchMovies() throws {
        movieVM.searchMovie("Test") { (movies) -> (Void) in
            XCTAssert(movies.count != 0, "Search Results Fetched")
        }
    }
    func testPagination() throws {
        movieVM.fetchMoviesOffset(2) { (movies) -> (Void) in
            XCTAssert(movies.count != 0, "Page 2 Data Fetched")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
