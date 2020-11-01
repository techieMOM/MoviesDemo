//
//  MovieCollectionViewCell.swift
//  MoviesDemo
//
//  Created by SOWJI on 01/11/20.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGenres: UILabel!
    
    func roundCorners() {
        self.poster.layer.cornerRadius = 5
        self.poster.layer.borderWidth = 1
        self.poster.layer.borderColor = UIColor.gray.cgColor
    }
}
