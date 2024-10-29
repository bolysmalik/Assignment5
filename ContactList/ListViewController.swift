//
//  ListViewController.swift
//  ContactList
//
//  Created by Bolys Malik on 30.10.2024.
//

import UIKit
class ContactsData{
    let name: String
    let num: String
    
    init(name: String, num: String) {
        self.name = name
        self.num = num
    }
}

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let contacts: [ContactsData] = [
        ContactsData(name: "Diana Miller", num: "812-345-9876"),
        ContactsData(name: "George Garcia", num: "456-789-1234"),
        ContactsData(name: "Fiona Johnson", num: "923-675-3412"),
        ContactsData(name: "Evan Brown", num: "234-678-1123"),
        ContactsData(name: "Alice Smith", num: "302-789-6543"),
        ContactsData(name: "Jack Wilson", num: "415-987-2314"),
        ContactsData(name: "Bob Davis", num: "523-342-7812"),
    ]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = contacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let infoVC = storyboard.instantiateViewController(withIdentifier: "InformationController") as? InformationController {
            infoVC.contactData = contacts[indexPath.row]
            navigationController?.present(infoVC, animated: true)
        }
    }
}
