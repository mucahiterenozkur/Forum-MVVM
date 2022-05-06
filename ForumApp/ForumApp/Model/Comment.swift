//
//  Comment.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 4.04.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let comment = try? newJSONDecoder().decode(Comment.self, from: jsonData)

import Foundation

// MARK: - CommentElement
struct CommentElement: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias Comment = [CommentElement]

