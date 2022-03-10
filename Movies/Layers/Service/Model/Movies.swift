//
//  Movies.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import Foundation

struct Movies {
  var results: [Movie]
}

extension Movies: Codable {
  enum CodingKeys: String, CodingKey {
    case results
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    results = try container.decodeValue(forKey: .results)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(results, forKey: .results)
  }
  
  static func make(data: Data) -> Movies? {
    return try? JSONDecoder().decode(Movies.self, from: data)
  }
}
