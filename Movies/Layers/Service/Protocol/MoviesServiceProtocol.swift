//
//  MoviesServiceProtocol.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import Foundation

protocol MoviesServiceProtocol {
  func fetchMovies(_ completion: @escaping (Result<Movies?>) -> Void)
  func getDtails(_ movieId: Int, _ completion: @escaping (Result<Movie?>) -> Void)
}

extension MoviesServiceProtocol {
  func fetchMovies(_ completion: @escaping (Result<Movies?>) -> Void) { }
  func getDtails(_ movieId: Int, _ completion: @escaping (Result<Movie?>) -> Void) { }
}
