//
//  ContactDetailViewController.swift
//  ContactsApp
//
//  Created by Beyza Sude Erol on 25.07.2023.
//

import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactSectionLabel: UILabel!
    @IBOutlet weak var contactCollectionView: UICollectionView!
    
    var otherContancts: [ContactModel] = [ContactModel]()
    var name = ""
    var section = ""
    var img = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactCollectionView.delegate = self
        contactCollectionView.dataSource = self
        
        contactNameLabel.text = name
        contactSectionLabel.text = section
        contactImageView.image = UIImage(named: img)
    }
}

//MARK: - CollectionView Delegate Methods
extension ContactDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return otherContancts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCollectionViewCell", for: indexPath) as! ContactCollectionViewCell
        
        cell.contactNameLabel.text = otherContancts[indexPath.row].name
        cell.contactImage.image = UIImage(named: otherContancts[indexPath.row].gender)
        
        return cell
    }
    
}
