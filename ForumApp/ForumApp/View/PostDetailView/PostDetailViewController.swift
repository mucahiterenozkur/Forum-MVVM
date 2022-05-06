//
//  PostDetailViewController.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 4.04.2022.
//

import UIKit

final class PostDetailViewController: UIViewController {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var readCommentsButton: UIButton!
    
    public var postDetailViewModel: PostDetailViewModelProtocol!  {
        didSet {
            postDetailViewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Content of the post"
        readCommentsButton.configuration?.attributedTitle?.font = UIFont(name: "Chalkboard SE", size: CGFloat(20))
        containerView.layer.cornerRadius = 20
        postDetailViewModel.load()
    }
    
    @IBAction private func readComments(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        let viewModel = CommentViewModel(service: ForumAppService())
        vc.commentViewModel = viewModel
        vc.commentViewModel.postID = postDetailViewModel.postID
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension PostDetailViewController: PostDetailViewModelDelegate {
    
    internal func fillLabels(title: String, body: String, name: String) {
        titleLabel.text = title
        bodyLabel.text = body
        nameLabel.text = name
    }
    
}
