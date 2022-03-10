//
//  Movie.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import Foundation

struct Movie {
  var movieId: Int
  var name: String?
  var description: String
  var releaseDate: Date?
  var posterUrl: String
}

extension Movie: Codable {
  enum CodingKeys: String, CodingKey {
    case movieId = "id"
    case name = "title"
    case description = "overview"
    case releaseDate = "release_date"
    case posterUrl = "poster_path"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    movieId = try container.decodeValue(forKey: .movieId)
    name = try container.decodeValueIfPresent(forKey: .name)
    description = try container.decodeValue(forKey: .description)
    posterUrl = try container.decodeValue(forKey: .posterUrl)
    let rawDate = try container.decode(String.self, forKey: .releaseDate)
    releaseDate = DateFormatter.serverDateTime.date(from: String(rawDate))
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(movieId, forKey: .movieId)
    try container.encode(name, forKey: .name)
    try container.encode(description, forKey: .description)
    try container.encode(posterUrl, forKey: .posterUrl)
    try container.encode(releaseDate, forKey: .releaseDate)
  }
  
  static func make(data: Data) -> Movie? {
    return try? JSONDecoder().decode(Movie.self, from: data)
  }
}
