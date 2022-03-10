//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import Foundation

final class MoviesViewModel {
  
  let moviesService: MoviesServiceProtocol
  var updateUI: () -> Void = { }
  var title = ""
  
  var viewModels = [MoviesCellViewModel]() {
    didSet {
      updateView()
      updateUI()
    }
  }
  
  init(
    moviesService: MoviesServiceProtocol = MoviesDataService()
  ) {
    self.moviesService = moviesService
    getMovies()
  }
  
  func getMovies() {
    moviesService.fetchMovies { [weak self] result in
      switch result {
      case .success(let response):
        guard let self = self, let movies = response?.results else { return }
        self.viewModels = movies.compactMap(MoviesCellViewModel.init)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
  
  func updateView() {
    title = "MOVIES"
  }
  
  func modelFor(indexPath: IndexPath) -> MoviesCellViewModel {
    return viewModels[indexPath.row]
  }
}
