//
//  JSONParsing.swift
//  TestIOS
//
//  Created by Arnaud Thomazo on 06/03/2019.
//  Copyright © 2019 Arnaud Thomazo. All rights reserved.
//

import Foundation

typealias JSONDict = [String: Any]

extension Dictionary where Key == String {
    func string(_ key: String) -> String? {
        if let value = self[key] as? String {
            return value
        } else {
            print("Missing parameter '\(key)'")
            return nil
        }
    }
    
    func int(_ key: String) -> Int? {
        if let value = self[key] as? Int {
            return value
        } else {
            print("Missing parameter '\(key)'")
            return nil
        }
    }
    
    func array(_ key: String) -> [JSONDict] {
        if let value = self[key] as? [JSONDict] {
            return value
        } else {
            print("Missing parameter '\(key)'")
            return []
        }
    }
    
    func dict(_ key: String) -> JSONDict? {
        if let value = self[key] as? JSONDict{
            return value
        } else {
            print("Missing parameter '\(key)'")
            return nil
        }
    }
}
