//
//  PersonsExtTableViewController.swift
//  ContactList
//
//  Created by serg on 15.01.2023.
//

import UIKit

class PersonsExtTableViewController: UITableViewController {
    
    private let phoneImage = UIImage(systemName: "phone")
    private let mailImage = UIImage(systemName: "mail")
    private let headerHeigth = 40
    
    var contacts: [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        contacts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        contacts[section].name
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "extendedContact", for: indexPath)
        let contact = contacts[indexPath.section]
        
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            content.text = contact.name
            content.image = phoneImage
        default:
            content.text = contact.email
            content.image = mailImage
        }
        cell.contentConfiguration = content

        return cell
    }

}
