//
//  CommentViewController.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 4.04.2022.
//

import UIKit

final class CommentViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    public var commentViewModel: CommentViewModelProtocol!  {
        didSet {
            commentViewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comments"
        prepareTableView()
        commentViewModel.load()
    }
    
    fileprivate func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "commentCell")
    }
    
}

extension CommentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commentViewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        cell.configure(with: commentViewModel.comment(index: indexPath.row)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 20
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 20
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
        tableView.contentInset.bottom = -verticalPadding/2
        tableView.contentInset.top = -verticalPadding/2
    }
    
}

extension CommentViewController: CommentViewModelDelegate {
    
    internal func reloadData() {
        tableView.reloadData()
    }
    
}
