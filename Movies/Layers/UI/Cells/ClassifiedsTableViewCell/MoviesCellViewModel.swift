//
//  MoviesCellViewModel.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import Foundation
import UIKit

struct MoviesCellViewModel {
  var movieId: Int
  var name: String
  var posterUrl: String?
  var releaseDate: String
  
  init(movie: Movie) {
    self.movieId = movie.movieId
    self.name = movie.name ?? ""
    self.posterUrl = Constants.Urls.imageBaseUrl + movie.posterUrl
    self.releaseDate = DateFormatter.year.string(from: movie.releaseDate!)
  }
}
