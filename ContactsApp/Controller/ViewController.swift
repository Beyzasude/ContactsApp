//
//  ViewController.swift
//  ContactsApp
//
//  Created by Beyza Sude Erol on 25.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    private var selectedContactType: ContactType? {
        didSet {
            contactsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
    }
    
    @IBAction func filterButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PickerViewController", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(identifier: "PickerViewController") as? PickerViewController {
            vc.delegate = self
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
    }
}

//MARK: - PickerViewController Delegate Methods
extension ViewController: PickerViewControllerDelegate {
    func didSelectContactType(_ type: ContactType) {
        selectedContactType = type
    }
}

//MARK: - TableView Delegate Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return setSections().count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return setSections()[section].contactType
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterContacts(section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as! ContactTableViewCell
        
        cell.cellContactImageView.image = UIImage(named: filterContacts(indexPath.section)[indexPath.row].gender)
        cell.cellContactNameLabel.text = filterContacts(indexPath.section)[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentContact = filterContacts(indexPath.section)[indexPath.row]
        var otherContancts = filterContacts(indexPath.section)
        
        if let indexToRemove = otherContancts.firstIndex(of: currentContact) {
            otherContancts.remove(at: indexToRemove)
        }
        
        if let vc = storyboard?.instantiateViewController(identifier: "ContactDetailViewController") as? ContactDetailViewController {
            
            vc.name = filterContacts(indexPath.section)[indexPath.row].name
            vc.img = filterContacts(indexPath.section)[indexPath.row].gender
            vc.section = filterContacts(indexPath.section)[indexPath.row].contactType.contactType
            vc.otherContancts = otherContancts
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func setSections() -> [ContactType] {
        if let selectedContactType = selectedContactType, selectedContactType != .allContacts {
            return [selectedContactType]
        }
            return ContactType.allCases
    }
    
    private func filterContacts(_ sectionIndex: Int) -> [ContactModel] {
        if let selectedContactType, selectedContactType != .allContacts {
            return Contacts.contacts.filter({ $0.contactType == selectedContactType})
        } else {
            return Contacts.contacts.filter({ $0.contactType == ContactType.allCases[sectionIndex] })
        }
    }
}

