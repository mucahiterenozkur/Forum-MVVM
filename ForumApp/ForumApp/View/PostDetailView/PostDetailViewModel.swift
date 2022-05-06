//
//  PostDetailViewModel.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 4.04.2022.
//

import Foundation

protocol PostDetailViewModelProtocol {
    var delegate: PostDetailViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    var name: String? { get set }
    var title: String? { get set }
    var body: String? { get set }
    var postID: Int? { get set }
    func load()
    func post(index: Int) -> PostElement?
}

protocol PostDetailViewModelDelegate: AnyObject {
    func fillLabels(title: String, body: String, name: String)
}

final class PostDetailViewModel {
    
    private var postDetailList: Post = []
    
    public let service: ForumAppService
    internal weak var delegate: PostDetailViewModelDelegate?
    internal var name: String?
    internal var title: String?
    internal var body: String?
    internal var postID: Int?
    
    public init(service: ForumAppService) {
        self.service = service
    }
    
    fileprivate func getPostDetails () {
        guard let title = title, let body = body, let name = name else { return }
        self.delegate?.fillLabels(title: title, body: body, name: name)
    }
    
}

extension PostDetailViewModel: PostDetailViewModelProtocol {
    
    public var numberOfItems: Int {
        postDetailList.count
    }
    
    public func load() {
        getPostDetails()
    }
    
    public func post(index: Int) -> PostElement? {
        postDetailList[index]
    }
    
}
