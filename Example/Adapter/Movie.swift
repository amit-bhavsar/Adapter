//
//  Movie.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 17/06/21.
//

import Foundation

struct Movie: Identifiable, Codable {
    
    let id: String
    let title         : String
    let avatar      : String?
    var rating       : Int = 0
    let createdAt : String?
}
