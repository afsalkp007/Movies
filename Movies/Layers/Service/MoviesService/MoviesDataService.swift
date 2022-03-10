//
//  MoviesDataService.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import Foundation

enum Result<T> {
  case success(T)
  case failure(Error)
}

final class MoviesDataService: MoviesServiceProtocol {
  
  /// Fetch movies data
  /// - Parameter completion: Called when operation finishes
  func fetchMovies(_ completion: @escaping (Result<Movies?>) -> Void) {
    
    let request = URLRequest(url: URL(string: Constants.Urls.baseUrl + Constants.Urls.moviesUrl + "?api_key=\(Constants.Keys.apiKey)")!)
    let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
      DispatchQueue.main.async {
        completion(.success(data.flatMap({ Movies.make(data: $0) }) ))
      }
    })
    task.resume()
  }
  
  /// Get Movie Details
  /// - Parameters:
  ///   - movieId: id for a movie
  ///   - completion: Called when operation finishes
  func getDtails(_ movieId: Int, _ completion: @escaping (Result<Movie?>) -> Void) {
    
    let request = URLRequest(url: URL(string: Constants.Urls.baseUrl + Constants.Urls.movieDetail + "/\(movieId)" + "?api_key=\(Constants.Keys.apiKey)")!)
    let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
      DispatchQueue.main.async {
        completion(.success(data.flatMap({ Movie.make(data: $0) }) ))
      }
    })
    task.resume()
  }
}
