//
//  person.swift
//  mvc1
//
//  Created by roporter on 19/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import Foundation

class Person {
    private var _firstName: String!
    private var _lastName: String!
    
    var firstName: String {
        get {
            return self._firstName
        }
        set {
            if newValue != "" {
                self._firstName = newValue
            }
        }
    }
    var lastname: String {
        get {
            return self._lastName
        }
        set {
            if newValue != "" {
                self._lastName = newValue
            }
        }
    }
    var fullName: String {
        return "\(self._firstName) \(self._lastName)"
    }
    
    init(first: String, last: String) {
        self._firstName = first
        self._lastName = last
    }
}