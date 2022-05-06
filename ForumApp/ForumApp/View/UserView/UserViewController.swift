//
//  UserViewController.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 3.04.2022.
//

import UIKit

final class UserViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    public var userViewModel: UserViewModelProtocol!  {
        didSet {
            userViewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        userViewModel.load()
    }
    
    fileprivate func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "userCell")
    }
    
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userViewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        cell.configure(with: userViewModel.user(index: indexPath.row)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostViewController") as! PostViewController
        let viewModel = PostViewModel(service: ForumAppService())
        vc.postViewModel = viewModel
        vc.postViewModel.userID = userViewModel.user(index: indexPath.row)?.id
        vc.postViewModel.name = userViewModel.user(index: indexPath.row)?.name
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 20
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 20
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
}

extension UserViewController: UserViewModelDelegate {
    
    internal func reloadData() {
        tableView.reloadData()
    }
    
}
