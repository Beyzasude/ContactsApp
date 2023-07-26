//
//  Contanct.swift
//  ContactsApp
//
//  Created by Beyza Sude Erol on 25.07.2023.
//

import Foundation

struct ContactModel: Equatable {
    var name: String
    var gender: String
    var contactType: ContactType
    
    static func == (lhs: ContactModel, rhs: ContactModel) -> Bool {
        return lhs.name == rhs.name &&
        lhs.gender == rhs.gender &&
        lhs.contactType == rhs.contactType
    }
}

enum ContactType: CaseIterable {
    case allContacts
    case family
    case friends
    case work
    case danceClass
    case bookGroup
    
    var contactType: String {
        switch self {
        case .allContacts:
            return "All Contacts"
        case .family:
            return "Family"
        case .friends:
            return "Friends"
        case .work:
            return "Work"
        case .danceClass:
            return "Dance Class"
        case .bookGroup:
            return "Book Group"
        }
    }
}

struct Contacts {
    static let contacts: [ContactModel] = [
        ContactModel(name: "Ayşe", gender: "women", contactType: .friends),
        ContactModel(name: "Ezgi", gender: "women", contactType: .bookGroup),
        ContactModel(name: "Ahmet", gender: "man", contactType: .danceClass),
        ContactModel(name: "Nur", gender: "women", contactType: .work),
        ContactModel(name: "Batuhan", gender: "man", contactType: .family),
        ContactModel(name: "Serap", gender: "women",  contactType: .danceClass),
        ContactModel(name: "Beyza", gender: "women", contactType: .work),
        ContactModel(name: "Ferhat", gender: "man", contactType: .family),
        ContactModel(name: "Aybüke", gender: "women", contactType: .bookGroup),
        ContactModel(name: "Burak", gender: "man", contactType: .friends),
        ContactModel(name: "Can", gender: "man",  contactType: .bookGroup),
        ContactModel(name: "Batur", gender: "man", contactType: .work),
        ContactModel(name: "Esila", gender: "women", contactType: .danceClass),
        ContactModel(name: "Semra", gender: "women", contactType: .friends),
        ContactModel(name: "Mehmet", gender: "man",  contactType: .work),
        ContactModel(name: "Eda", gender: "women", contactType: .bookGroup),
        ContactModel(name: "Elif", gender: "women", contactType: .friends),
        ContactModel(name: "Harun", gender: "man", contactType: .danceClass),
        ContactModel(name: "Dilara", gender: "women", contactType: .family),
        ContactModel(name: "Mehmet", gender: "man",  contactType: .bookGroup),
        ContactModel(name: "Zeynep", gender: "women", contactType: .work),
        ContactModel(name: "Emre", gender: "man", contactType: .danceClass),
        ContactModel(name: "Cansu", gender: "women", contactType: .family),
        ContactModel(name: "Büşra", gender: "women", contactType: .friends),
        ContactModel(name: "Oğuzhan", gender: "man", contactType: .family)
    ]
}
