//
//  User.swift
//  RealFrensIOS
//
//  Created by Purin Spitzer on 11/22/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var username: String
    var profileImageURL: String?
    var fullname: String?
    var bio: String?
    let email: String
}

