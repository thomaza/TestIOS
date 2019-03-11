//
//  UserDetailView.swift
//  TestIOS
//
//  Created by Arnaud Thomazo on 06/03/2019.
//  Copyright © 2019 Arnaud Thomazo. All rights reserved.
//

import UIKit

class UserDetailView: UIView {
    
    @IBOutlet weak var avatarImageView: UIImageView?
    @IBOutlet weak var emailLabel: UILabel?
    @IBOutlet weak var genderLabel: UILabel?
    @IBOutlet weak var ageLabel: UILabel?
    @IBOutlet weak var phoneLabel: UILabel?
    @IBOutlet weak var cellLabel: UILabel?
    @IBOutlet weak var streetLabel: UILabel?
    @IBOutlet weak var cityLabel: UILabel?
    @IBOutlet weak var stateLabel: UILabel?
    @IBOutlet weak var latitudeLabel: UILabel?
    @IBOutlet weak var longitudeLabel: UILabel?
    @IBOutlet weak var offsetLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?

    func configureWithItem(item: UserModelItem) {
        
        let url = URL(string: item.avatarImageURL ?? "")
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.avatarImageView?.image = UIImage(data: data!)
            }
        }
        
        emailLabel?.text = "Email: \(item.email ?? "Email not assigned")"
        genderLabel?.text = "Gender: \(item.gender ?? "Gender not assigned")"
        ageLabel?.text = "Age: \(String(item.age!))"
        phoneLabel?.text = "Phone: \(item.phone ?? "Phone not assigned")"
        cellLabel?.text = "Cell: \(item.cell ?? "Cell not assigned")"
        streetLabel?.text = "Street: \(item.street ?? "Street not assigned")"
        cityLabel?.text = "City: \(item.city ?? "City not assigned")"
        stateLabel?.text = "State: \(item.state ?? "State not assigned")"
        latitudeLabel?.text = "Latitude: \(item.latitude ?? "State not assigned")"
        longitudeLabel?.text = "Longitude: \(item.longitude ?? "State not assigned")"
        offsetLabel?.text = "Timezone offset: \(item.offset ?? "State not assigned")"
        descriptionLabel?.text = "Timezone: \(item.description ?? "State not assigned")"
    }
}
