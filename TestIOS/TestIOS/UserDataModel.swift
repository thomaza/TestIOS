//
//  UserDataModel.swift
//  TestIOS
//
//  Created by Arnaud Thomazo on 28/02/2019.
//  Copyright © 2019 Arnaud Thomazo. All rights reserved.
//

import Foundation

protocol UserDataModelDelegate: class {
    func didRecieveDataUpdate(data: [UserModelItem])
    func didFailDataUpdateWithError(error: Error)
}

class UserDataModel {
    
    weak var delegate: UserDataModelDelegate?

    func requestData(page: Int) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let urlWithParam = "https://randomuser.me/api/?results=10&seed=test&page=\(page)"
        
        let url = URL(string: urlWithParam)!
        let task = session.dataTask(with: url) { data, response, error in
            
            var users = [UserModelItem]()
            
            if let data = data {
                users = self.parseUsersJSON(from: data)
                self.delegate?.didRecieveDataUpdate(data: users)
            }
            
            guard error == nil else {
                self.delegate?.didFailDataUpdateWithError(error: "error: \(error!)" as! Error)
                return
            }
            
        }
        
        // execute the HTTP request
        task.resume()
    }
    
    func parseUsersJSON(from data: Data) -> [UserModelItem] {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                var users = [UserModelItem]()
                for userJSON in json.array("results") {
                    if let user = UserModelItem(json: userJSON) {
                        users.append(user)
                    }
                }
                return users
            }
        } catch {
            print("Couldn't parse JSON: \(error)")
            if let utf8String = String(data: data, encoding: String.Encoding.utf8) {
                print("Received: \(utf8String)")
            }
        }
        
        return []
    }
    
}

