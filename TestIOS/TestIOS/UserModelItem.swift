//
//  UserModelItem.swift
//  TestIOS
//
//  Created by Arnaud Thomazo on 28/02/2019.
//  Copyright © 2019 Arnaud Thomazo. All rights reserved.
//

import Foundation

class UserModelItem {
    var title: String?
    var firstName: String?
    var lastName: String?
    var gender: String?
    var age: Int?

    var avatarImageURL: String?
    var email: String?
    
    var street: String?
    var city: String?
    var state: String?
    var latitude: String?
    var longitude: String?
    var offset: String?
    var description: String?

    var phone: String?
    var cell: String?
    
    var isFavorite: Bool = false
 
    init?(json: [String: Any]) {
        guard let name = json.dict("name") else { return nil }
        guard let first = name.string("first") else { return nil }
        guard let last = name.string("last") else { return nil }
        guard let gender = json.string("gender") else { return nil }
        guard let dob = json.dict("dob") else { return nil }
        guard let age = dob.int("age") else { return nil }
        guard let title = name.string("title") else { return nil }
        
        guard let email = json.string("email") else { return nil }
        guard let thumbnail = json.dict("picture")?.string("thumbnail") else { return nil }
        
        guard let location = json.dict("location") else { return nil }
        guard let street = location.string("street") else { return nil }
        guard let city = location.string("city") else { return nil }
        guard let state = location.string("state") else { return nil }
        guard let coordinates = location.dict("coordinates") else { return nil }
        guard let latitude = coordinates.string("latitude") else { return nil }
        guard let longitude = coordinates.string("longitude") else { return nil }
        guard let timezone = location.dict("timezone") else { return nil }
        guard let offset = timezone.string("offset") else { return nil }
        guard let description = timezone.string("description") else { return nil }

        guard let phone = json.string("phone") else { return nil }
        guard let cell = json.string("cell") else { return nil }
        
        self.firstName = first
        self.lastName = last
        self.title = title
        self.gender = gender
        self.age = age
        
        self.email = email
        self.avatarImageURL = thumbnail
        
        self.street = street
        self.city = city
        self.state = state
        self.latitude = latitude
        self.longitude = longitude
        
        self.offset = offset
        self.description = description
        
        self.phone = phone
        self.cell = cell
    }
}
