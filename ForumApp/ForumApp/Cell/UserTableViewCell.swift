//
//  UserTableViewCell.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 6.04.2022.
//

import UIKit

final class UserTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var companyLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    internal func configure(with user: UserElement) {
        nameLabel.text = user.name
        usernameLabel.text = user.username
        emailLabel.text = user.email
        websiteLabel.text = user.website
        phoneLabel.text = user.phone
        companyLabel.text = user.company.name
        cityLabel.text = user.address.city
    }
    
}
