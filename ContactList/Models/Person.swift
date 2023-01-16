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
    
    static func getContacts(withCount count: Int) -> [Person] {
        let dataSource = DataStore.shared
        if count < 1 {
            return []
        }
        let count = min(count, dataSource.names.count * dataSource.surnames.count * dataSource.domainNames.count)
        var persons: [Person] = []
        
        while persons.count < count {
            let name = dataSource.names.randomElement() ?? ""
            let surname = dataSource.surnames.randomElement() ?? ""
            let email = generateEmail(name: name, surname: surname, domainNames: dataSource.domainNames)
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
    
    private static func generateEmail(name: String, surname: String, domainNames: [String]) -> String {
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
}
