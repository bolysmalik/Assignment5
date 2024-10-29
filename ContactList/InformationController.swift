//
//  InformationController.swift
//  ContactList
//
//  Created by Bolys Malik on 29.10.2024.
//

import UIKit

class InformationController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var numText: UITextField!
    var contactData: ContactsData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(contactData?.name)
        view.backgroundColor = .white
        nameText?.text = contactData?.name
        numText?.text = contactData?.num
    }

}
