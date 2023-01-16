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
        
        tableView.backgroundColor = .white
        tableView.allowsSelection = false
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        contacts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(headerHeigth)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        contacts[section].name
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "extendedContact", for: indexPath)
        let contact = contacts[indexPath.section]
        
        var content = cell.defaultContentConfiguration()
        
        if indexPath.row == 0 {
            content.text = contact.name
            content.image = phoneImage
        } else if indexPath.row == 1 {
            content.text = contact.email
            content.image = mailImage
        }
        cell.contentConfiguration = content

        return cell
    }

}
