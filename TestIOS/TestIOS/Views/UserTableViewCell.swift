//
//  UserTableViewCell.swift
//  TestIOS
//
//  Created by Arnaud Thomazo on 28/02/2019.
//  Copyright © 2019 Arnaud Thomazo. All rights reserved.
//

import Foundation
import UIKit


class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView?
    @IBOutlet weak var firstNameLabel: UILabel?
    @IBOutlet weak var lastNameLabel: UILabel?
    @IBOutlet weak var emailLabel: UILabel?
        
    func configureWithItem(item: UserModelItem) {
        
        let url = URL(string: item.avatarImageURL ?? "")
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.avatarImageView?.image = UIImage(data: data!)
            }
        }
        firstNameLabel?.text = item.firstName
        lastNameLabel?.text = item.lastName
        emailLabel?.text = item.email
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
