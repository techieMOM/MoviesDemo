//
//  AppConstants.swift
//  MoviesDemo
//
//  Created by SOWJI on 01/11/20.
//

import Foundation
import UIKit

struct API {
    public static let moviesURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=%@&language=en-US&page=%d"
    public static let searchMovieURL = "https://api.themoviedb.org/3/search/movie?api_key=%@&language=en-US&include_adult=false&query=%@"
    public static let API_TOKEN = "4524dbe1cb31c1afbf85b85e0f8963c2"
    public static let baseImageURL = "https://image.tmdb.org/t/p/w500/"
    public static let genreURL = "https://api.themoviedb.org/3/genre/movie/list?api_key=%@&language=en-US"
}
var isiPad : Bool {
    if UIDevice.current.userInterfaceIdiom == .pad {
        return true
    } else {
        return false
    }
}
var isSmallerDevice : Bool {
    if UIScreen.main.nativeBounds.height > 1334 {
        return false
    } else {
        return true
    }
}
