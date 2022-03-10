//
//  MoviesDetailViewController.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import UIKit

final class MoviesDetailViewController: UIViewController, Storyboarded {
  
  var viewModel: MoviesDetailViewModel?
  
  @IBOutlet weak var posterImageView: CacheableImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var yearLabel: UILabel!
  @IBOutlet weak var descriptionTextView: UITextView!
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  private func configureView() {
    viewModel?.updateUI = { [weak self] movie in
      guard let self = self, let movie = movie, let releaseDate = movie.releaseDate else { return }
      self.nameLabel.text = movie.name
      self.descriptionTextView.text = movie.description
      let date = DateFormatter.year.string(from: releaseDate)
      self.yearLabel.text = date
      let url = Constants.Urls.imageBaseUrl + movie.posterUrl
      self.posterImageView.setUpLoader()
      self.posterImageView.downloadImageFrom(urlString: url, imageMode: .scaleAspectFit)
    }
  }
}
