//
//  CommentTableViewCell.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 7.04.2022.
//

import UIKit

final class CommentTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    internal func configure(with comment: CommentElement) {
        nameLabel.text = comment.name
        bodyLabel.text = comment.body
        emailLabel.text = comment.email
    }
    
}
