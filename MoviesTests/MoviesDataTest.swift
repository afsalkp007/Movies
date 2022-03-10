//
//  MoviesDataTest.swift
//  MoviesDataTest
//
//  Created by Afsal Mohammed on 3/9/22.
//

import XCTest
@testable import Movies

class MoviesDataTest: XCTestCase {
  
  func testParsing() throws {
    let json: [String: Any] = [
      "id": 634649,
      "title": "Spider-Man: No Way Home",
      "release_date": "2021-12-15",
      "overview": "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
      "poster_path": "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg"
    ]
    
    
    let data = try JSONSerialization.data(withJSONObject: json, options: [])
    let decoder = JSONDecoder()
    let movie = try decoder.decode(Movie.self, from: data)
    
    XCTAssertEqual(movie.name, "Spider-Man: No Way Home")
    XCTAssertEqual(movie.releaseDate, DateFormatter.serverDateTime.date(from: "2021-12-15"))
    XCTAssertEqual(movie.description, "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.")
    XCTAssertEqual(movie.posterUrl, "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg")
  }
}
