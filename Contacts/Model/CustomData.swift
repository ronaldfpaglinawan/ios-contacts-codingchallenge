//
//  CustomData.swift
//  Contacts
//
//  Created by Ronald Fornis Paglinawan on 17/06/21.
//

import Foundation

struct person: Codable {
    let name: String
    let email: String
    let mobile_number: String
    let address: String
    let friends: [String]
}

struct sampleRecord: Codable {
    let people: [person]
}
