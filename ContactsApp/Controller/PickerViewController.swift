//
//  PickerViewController.swift
//  ContactsApp
//
//  Created by Beyza Sude Erol on 25.07.2023.
//

import UIKit


protocol PickerViewControllerDelegate {
    func didSelectContactType(_ type: ContactType)
}

extension PickerViewControllerDelegate {
    func didSelectContactType(_ type: ContactType) {}
}

class PickerViewController: UIViewController {

    @IBOutlet weak var filterPickerView: UIPickerView!
    private var selectedContactType: ContactType?
    
    var delegate: PickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterPickerView.delegate = self
        filterPickerView.dataSource = self
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.didSelectContactType(selectedContactType ?? .allContacts)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}

//MARK: - PickerView Delegate Methods
extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ContactType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ContactType.allCases[row].contactType
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedContactType = ContactType.allCases[row]
    }
    
}
