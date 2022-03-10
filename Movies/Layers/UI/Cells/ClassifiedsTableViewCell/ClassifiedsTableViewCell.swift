//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import UIKit

final class MoviesTableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var timeAgoLabel: UILabel!
  @IBOutlet weak var productImageView: CacheableImageView!
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    selectionStyle = .none
  }
}
