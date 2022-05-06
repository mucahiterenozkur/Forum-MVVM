//
//  PostViewModel.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 4.04.2022.
//

import Foundation

protocol PostViewModelProtocol {
    var delegate: PostViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    var userID: Int? { get set }
    var name: String? { get set }
    func load()
    func post(index: Int) -> PostElement?
}

protocol PostViewModelDelegate: AnyObject {
    func reloadData()
}

final class PostViewModel {
    
    private var postList: Post = [] {
        didSet {
            //self.delegate?.reloadData()
        }
    }
    
    public let service: ForumAppService
    internal weak var delegate: PostViewModelDelegate?
    internal var userID: Int?
    internal var name: String?
    
    public init(service: ForumAppService) {
        self.service = service
    }
    
    fileprivate func getPosts () {
        service.getPosts(userID: userID!) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let post):
                self.postList = post
                self.delegate?.reloadData()
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
}

extension PostViewModel: PostViewModelProtocol {
    
    public var numberOfItems: Int {
        postList.count
    }
    
    public func load() {
        getPosts()
    }
    
    public func post(index: Int) -> PostElement? {
        postList[index]
    }
    
}
