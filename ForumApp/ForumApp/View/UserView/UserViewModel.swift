//
//  UserViewModel.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 4.04.2022.
//

import Foundation

protocol UserViewModelProtocol {
    var delegate: UserViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    func load()
    func user(index: Int) -> UserElement?
}

protocol UserViewModelDelegate: AnyObject {
    func reloadData()
}

final class UserViewModel {
    
    private var userList: User = []
    
    public let service: ForumAppService
    internal weak var delegate: UserViewModelDelegate?
    
    public init(service: ForumAppService) {
        self.service = service
    }
    
    fileprivate func getUsers () {
        service.getUsers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                self.userList = user
                self.delegate?.reloadData()
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
}

extension UserViewModel: UserViewModelProtocol {
    
    public func user(index: Int) -> UserElement? {
        userList[index]
    }
    
    
    public var numberOfItems: Int {
        userList.count
    }
    
    public func load() {
        getUsers()
    }
    
}
