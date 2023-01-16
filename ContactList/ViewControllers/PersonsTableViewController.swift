//
//  PersonsTableViewController.swift
//  ContactList
//
//  Created by serg on 14.01.2023.
//

import UIKit

class PersonsTableViewController: UITableViewController {
    
    var contacts: [Person]!
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleContact", for: indexPath)
        let contact = contacts[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = contact.name
        
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let contactVC = segue.destination as? ContactViewController else { return }
            contactVC.contact = contacts[indexPath.row]
        }
    }

}
