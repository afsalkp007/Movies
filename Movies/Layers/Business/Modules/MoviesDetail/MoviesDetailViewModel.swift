//
//  MoviesDetailViewModel.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import Foundation

final class MoviesDetailViewModel {
  
  let moviesService: MoviesServiceProtocol
  var movieId: Int
  var updateUI: (Movie?) -> Void = { _ in }
  
  init(moviesService: MoviesServiceProtocol = MoviesDataService(),
       movieId: Int) {
    self.moviesService = moviesService
    self.movieId = movieId
    getMovieDetails()
  }
  
  var movie: Movie? {
    didSet {
      updateUI(movie)
    }
  }
  
  private func getMovieDetails() {
    moviesService.getDtails(movieId) { [weak self] result in
      switch result {
      case .success(let movie):
        guard let self = self, let movie = movie else { return }
        self.movie = movie
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
