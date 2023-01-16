//
//  DataStore.swift
//  ContactList
//
//  Created by serg on 14.01.2023.
//

struct DataStore {
    
    // TODO: remove data generation and make this as class and singltone
    
    static func getContacts(withCount count: Int) -> [Person] {
        if count < 1 {
            return []
        }
        
        var persons: [Person] = []
        
        while persons.count < count {
            let name = names.randomElement() ?? ""
            let surname = surnames.randomElement() ?? ""
            let email = generateEmail(name: name, surname: surname)
            let number = generatePhoneNumber()
            let new_person = Person(firstName: name, lastName: surname, phoneNumber: number, email: email)
            if persons.contains(where: { existedPerson in
                existedPerson.name == new_person.name
            }) {
                print("person \(new_person.name) already exists -> skip")
                continue
            }
            if persons.contains(where: { existedPerson in
                existedPerson.email == new_person.email
            }) {
                print("person email \(new_person.email) already exists -> skip")
                continue
            }
            if persons.contains(where: { existedPerson in
                existedPerson.phoneNumber == new_person.phoneNumber
            }) {
                print("person phone \(new_person.phoneNumber) already exists -> skip")
                continue
            }
            persons.append(new_person)
        }
        return persons
    }
    
    private static func generateEmail(name: String, surname: String) -> String {
        if name.isEmpty && surname.isEmpty {
            return ""
        }
        if let domain = domainNames.randomElement() {
            if Int.random(in: 0..<100) < 95 {
                return "\(name.lowercased()).\(surname.lowercased())@\(domain)"
            }
        }
        return ""
    }
    
    private static func generatePhoneNumber() -> String {
        Int.random(in: 90000000000...99999999999).formatted().replacingOccurrences(of: ",", with: "")
    }
    
    private static let names = [
        "Cloe",
        "Jarrett",
        "Gunnar",
        "Ervin",
        "Nathalie",
        "Sidney",
        "Tyrese",
        "Jennifer",
        "Bianca",
        "Leilani",
        "Franklin",
        "Henry",
        "Jacob",
        "Daron",
        "Tate",
        "Gregory",
        "Devante",
        "Octavio",
        "Devyn",
    ]
    
    private static let surnames = [
        "Galloway",
        "Tamayo",
        "Gonzalez",
        "Kearney",
        "Whatley",
        "Connell",
        "Foreman",
        "Aragon",
        "See",
        "Churchill",
        "Seals",
        "Marcus",
        "Neumann",
        "Hayden",
        "Moran",
        "Montes",
        "Easton",
        "Thorn",
        "Schmitz",
        "McCann",
        "Ojeda",
        "Crowley",
        "Camacho",
        "Judge",
        "Drake",
    ]
    
    private static let domainNames = [
        "email.com",
        "email.ru",
        "yahoo.com",
        "ya.ru",
        "gmail.com",
    ]
}
