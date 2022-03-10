//
//  MoviesDetailCoordinator.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import UIKit

final class MoviesDetailCoordinator: Coordinator {
  
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start(_ model: MoviesCellViewModel) {
    let vc = MoviesDetailViewController.instantiate()
    vc.viewModel = MoviesDetailViewModel(movieId: model.movieId)
    navigationController.pushViewController(vc, animated: true)
  }
}
