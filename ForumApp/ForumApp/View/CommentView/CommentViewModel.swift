//
//  CommentViewModel.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 4.04.2022.
//

import Foundation

protocol CommentViewModelProtocol {
    var delegate: CommentViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    var postID: Int? { get set }
    func load()
    func comment(index: Int) -> CommentElement?
}

protocol CommentViewModelDelegate: AnyObject {
    func reloadData()
}

final class CommentViewModel {
    
    private var commentList: Comment = [] 
    
    public let service: ForumAppService
    internal weak var delegate: CommentViewModelDelegate?
    internal var postID: Int?
    
    public init(service: ForumAppService) {
        self.service = service
    }
    
    fileprivate func getComments () {
        service.getComments(postID: postID!) { result in
            switch result {
            case .success(let comment):
                self.commentList = comment
                self.delegate?.reloadData()
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
}

extension CommentViewModel: CommentViewModelProtocol {
    
    public var numberOfItems: Int {
        commentList.count
    }
    
    public func load() {
        getComments()
    }
    
    public func comment(index: Int) -> CommentElement? {
        commentList[index]
    }
    
}
