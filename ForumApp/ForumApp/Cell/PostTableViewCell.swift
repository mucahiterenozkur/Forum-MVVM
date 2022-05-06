//
//  PostTableViewCell.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 6.04.2022.
//

import UIKit

final class PostTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    internal func configure(with post: PostElement) {
        titleLabel.text = post.title
    }
    
}
