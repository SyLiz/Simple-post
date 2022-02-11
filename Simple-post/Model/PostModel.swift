//
//  File.swift
//  Simple-post
//
//  Created by BOICOMP21070027 on 10/2/2565 BE.
//

import Foundation

struct Post {
    let user: User
    let time: String
    let description: String
    let postImage: [String]
}

struct User {
    let name: String
    let imageUrl: String
}
