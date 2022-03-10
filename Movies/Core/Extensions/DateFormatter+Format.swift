//
//  DateFormatter+Format.swift
//  Movies
//
//  Created by Afsal Mohammed on 3/9/22.
//

import Foundation

extension DateFormatter {
  private static var base = DateFormatter()
  
  static var serverDateTime: DateFormatter {
    base.withFormat("yyyy-MM-dd")
  }
  
  static var year: DateFormatter {
    base.withFormat("yyyy")
  }
  
  func withFormat(_ format: String) -> DateFormatter {
    dateFormat = format
    return self
  }
}
