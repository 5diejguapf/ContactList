//
//  TabViewController.swift
//  ContactList
//
//  Created by serg on 15.01.2023.
//

import UIKit

class TabViewController: UITabBarController {

    var contacts = Person.getContacts(withCount: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableViews()
    }
    
    private func configTableViews() {
        guard let tabrootvcs = viewControllers else { return }
        for vc in tabrootvcs {
            guard let navi = vc as? UINavigationController else { continue }
            if let personVC = navi.topViewController as? PersonsTableViewController {
                personVC.contacts = contacts
            } else if let personExtVC = navi.topViewController as? PersonsExtTableViewController {
                personExtVC.contacts = contacts
            }
        }
    }

}
