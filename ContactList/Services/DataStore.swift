//
//  DataStore.swift
//  ContactList
//
//  Created by serg on 14.01.2023.
//

class DataStore {
    
    static let shared = DataStore()
    
    private init() {}
    
    
    var names = [
        "Cloe", "Jarrett", "Gunnar", "Ervin", "Nathalie",
        "Sidney", "Tyrese", "Jennifer", "Bianca", "Leilani",
        "Franklin", "Henry", "Jacob", "Daron", "Tate", "Gregory",
        "Devante", "Octavio", "Devyn",
    ]
    
    var surnames = [
        "Galloway", "Tamayo", "Gonzalez", "Kearney", "Whatley",
        "Connell", "Foreman", "Aragon", "See", "Churchill",
        "Seals", "Marcus", "Neumann", "Hayden", "Moran",
        "Montes", "Easton", "Thorn", "Schmitz", "McCann",
        "Ojeda", "Crowley", "Camacho", "Judge", "Drake",
    ]
    
    var domainNames = [
        "email.com", "email.ru", "yahoo.com",
        "ya.ru", "gmail.com",
    ]
}
