//
//  MovieDetailsViewController.swift
//  MoviesDemo
//
//  Created by SOWJI on 01/11/20.
//

import UIKit
import Nuke
class MovieDetailsViewController: BaseVC {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var releasedate: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var genres: UILabel!
    @IBOutlet var movieViewModel: MovieDetailsViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadUI()
        // Do any additional setup after loading the view.
    }
    
    func loadUI() {
        let movie = self.movieViewModel.movie
        self.name.text = movie?.name ?? ""
        self.overview.text = movie?.overview ?? ""
        print("Movie Rating : \(movie?.rating ?? 0.0)")
        self.rating.text = "Movie Rating : \(movie?.rating ?? 0.0)"
        self.genres.text = "Genres : \(movie?.genres ?? "")"
        self.releasedate.text = "Release Date : \(movie?.release_date ?? "")"

        if let imageURL = URL(string: movie?.poster ?? "") {
            Nuke.loadImage(
                with: imageURL,
                options: ImageLoadingOptions(
                    transition: .fadeIn(duration: 0.33),
                    contentModes: .init(success: .scaleToFill, failure: .scaleAspectFill, placeholder: .scaleAspectFill)
                ),
                into: self.poster
            )}
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
