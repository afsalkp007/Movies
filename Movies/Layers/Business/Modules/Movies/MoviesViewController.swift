//
//  MoviesViewController.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import UIKit

final class MoviesViewController: UIViewController, Storyboarded {
  
  var coordinator: MoviesDetailCoordinator?
  var viewModel: MoviesViewModel?
  
  @IBOutlet weak var tableView: UITableView!
  var loaderView = UIActivityIndicatorView()
  private let adapter = Adapter<MoviesCellViewModel, MoviesTableViewCell>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpLoader()
    tableView.register(cellType: MoviesTableViewCell.self)
    viewModel?.updateUI = { [weak self] in
      guard let self = self, let viewModel = self.viewModel else { return }
      self.title = viewModel.title
      self.adapter.items = viewModel.viewModels
      self.configureTableView()
      self.loaderView.stopAnimating()
    }
  }
  
  private func configureTableView() {
    adapter.cellHeight = 130.0
    tableView.delegate = adapter
    tableView.dataSource = adapter
    tableView.layer.cornerRadius = 0
    tableView.backgroundColor = UIColor.clear
    tableView.tableFooterView = UIView()
    tableView.reloadData()
    
    adapter.configure = { item, cell in
      cell.nameLabel.text = item.name
      cell.yearLabel.text = item.releaseDate
      guard let url = item.posterUrl else { return }
      cell.posterImageView.setUpLoader()
      cell.posterImageView.downloadImageFrom(urlString: url, imageMode: .scaleAspectFit)
    }
    
    adapter.select = { [weak self] viewModel in
      self?.coordinator?.start(viewModel)
    }
  }
  
  private func setUpLoader() {
    tableView.addSubview(loaderView)
    loaderView.hidesWhenStopped = true
    loaderView.translatesAutoresizingMaskIntoConstraints = false
    loaderView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
    loaderView.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
    loaderView.startAnimating()
  }
}
