//
//  Person.swift
//  ContactList
//
//  Created by serg on 14.01.2023.
//

struct Person {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let email: String
    
    var name: String {
        "\(firstName) \(lastName)"
    }
    
    // TODO: generate data here
}
