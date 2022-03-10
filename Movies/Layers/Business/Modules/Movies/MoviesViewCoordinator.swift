//
//  MoviesViewCoordinator.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import UIKit

final class MoviesViewCoordinator: Coordinator {
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = MoviesViewController.instantiate()
    vc.coordinator = MoviesDetailCoordinator(navigationController: navigationController)
    vc.viewModel = MoviesViewModel()
    navigationController.pushViewController(vc, animated: false)
  }
}
