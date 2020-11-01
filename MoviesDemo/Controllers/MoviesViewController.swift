//
//  MoviesViewController.swift
//  MoviesDemo
//
//  Created by SOWJI on 01/11/20.
//

import UIKit
import Nuke

class MoviesViewController: BaseVC {
    @IBOutlet weak var moviesCollection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var movieViewModel: MovieViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchMoviesData()
        // Do any additional setup after loading the view.
    }
    
    func fetchMoviesData() {
        self.showOverlay()
        movieViewModel.fetchMovies { _ in
            self.loadCollection()
            self.hideOverLay()
        }
    }
    func loadCollection() {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        layout.minimumInteritemSpacing = 5
        self.moviesCollection.collectionViewLayout = layout
        self.moviesCollection.backgroundColor = .clear
        self.moviesCollection.delegate = self
        self.moviesCollection.dataSource = self
        self.view.addSubview(self.moviesCollection)
        self.moviesCollection.reloadData()
    }
}
extension MoviesViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieViewModel.filteredMovies.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = isiPad ? 30 : 10
        let collectionViewSize = moviesCollection.frame.size.width - padding
        let numberOfRows : CGFloat = isiPad ? 3 : 2
        let width = collectionViewSize/numberOfRows
        return CGSize(width: width, height: (width + 100))
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        let movieData = self.movieViewModel.filteredMovies[indexPath.item]
        cell.movieTitle.text = movieData.name ?? ""
        cell.movieGenres.text = self.movieViewModel.fetchGenre(movieData.genre)
        cell.roundCorners()
        if let imageURL = URL(string: movieData.poster ?? "") {
            Nuke.loadImage(
                with: imageURL,
                options: ImageLoadingOptions(
                    transition: .fadeIn(duration: 0.33),
                    contentModes: .init(success: .scaleToFill, failure: .scaleAspectFill, placeholder: .scaleAspectFill)
                ),
                into: cell.poster
            )}
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueDetails", sender: indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == self.movieViewModel.filteredMovies.count - 1 && self.movieViewModel.currentPage < self.movieViewModel.totalPages {
            self.loadOffsetData(self.movieViewModel.currentPage + 1)
        }
    }
    
    func loadOffsetData(_ page : Int) {
        self.showOverlay()
        self.movieViewModel.fetchMoviesOffset(page) { items in
            self.movieViewModel.movies.append(contentsOf: items)
            self.movieViewModel.filteredMovies.append(contentsOf: items)
            self.moviesCollection.reloadData()
            self.hideOverLay()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MovieDetailsViewController {
            let movie = self.movieViewModel.filteredMovies[sender as! Int]
            movie.genres = self.movieViewModel.fetchGenre(movie.genre)
            vc.movieViewModel.movie = movie
        }
    }
}

extension MoviesViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.showOverlay()
        self.movieViewModel.searchMovie(searchBar.text ?? "") { movies in
            self.movieViewModel.filteredMovies = movies
            self.moviesCollection.reloadData()
            self.hideOverLay()
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.movieViewModel.filteredMovies = self.movieViewModel.movies
        self.moviesCollection.reloadData()
    }
    
}
