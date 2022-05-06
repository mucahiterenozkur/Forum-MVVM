//
//  UserService.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 4.04.2022.
//

import Foundation
import Alamofire

final class ForumAppService {
    
    static let shared = ForumAppService()
    
    final func getUsers(completion: @escaping (Result<User, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.dateDecoder
                do {
                    let users = try decoder.decode(User.self, from: data)
                    completion(.success(users))
                } catch {
                    print("******* JSON DECODE ERROR ****")
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    final func getPosts(userID: Int, completion: @escaping (Result<Post, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/users/\(userID)/posts"
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.dateDecoder
                do {
                    let posts = try decoder.decode(Post.self, from: data)
                    completion(.success(posts))
                } catch {
                    print("******* JSON DECODE ERROR ****")
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    final func getComments(postID: Int, completion: @escaping (Result<Comment, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts/\(postID)/comments"
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.dateDecoder
                do {
                    let comments = try decoder.decode(Comment.self, from: data)
                    completion(.success(comments))
                } catch {
                    print("******* JSON DECODE ERROR ****")
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
