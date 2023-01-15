//
//  TabViewController.swift
//  ContactList
//
//  Created by serg on 15.01.2023.
//

import UIKit

class TabViewController: UITabBarController {

    var contacts = DataStore.getContacts(withCount: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabrootvcs = viewControllers {
            for vc in tabrootvcs {
                guard let navi = vc as? UINavigationController else { continue }
                for naviVC in navi.viewControllers {
                    if let personVC = naviVC as? PersonsTableViewController {
                        personVC.contacts = contacts
                    } else if let personExtVC = naviVC as? PersonsExtTableViewController {
                        personExtVC.contacts = contacts
                    }
                }
            }
        }
    }

}
