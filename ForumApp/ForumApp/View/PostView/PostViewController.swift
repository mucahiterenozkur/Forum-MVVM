//
//  PostViewController.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 4.04.2022.
//

import UIKit

final class PostViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    public var postViewModel: PostViewModelProtocol!  {
        didSet {
            postViewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(postViewModel.name!)'s Posts"
        prepareCollectionView()
        postViewModel.load()
    }
    
    fileprivate func prepareCollectionView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell")
    }
    
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postViewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.configure(with: postViewModel.post(index: indexPath.row)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostDetailViewController") as! PostDetailViewController
        let viewModel = PostDetailViewModel(service: ForumAppService())
        vc.postDetailViewModel = viewModel
        vc.postDetailViewModel.title = postViewModel.post(index: indexPath.row)?.title
        vc.postDetailViewModel.body = postViewModel.post(index: indexPath.row)?.body
        vc.postDetailViewModel.postID = postViewModel.post(index: indexPath.row)?.id
        vc.postDetailViewModel.name = postViewModel.name
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 10
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
        tableView.contentInset.bottom = -verticalPadding/2
        tableView.contentInset.top = -verticalPadding/2
    }
    
}

extension PostViewController: PostViewModelDelegate {
    internal func reloadData() {
        tableView.reloadData()
    }
    
}
