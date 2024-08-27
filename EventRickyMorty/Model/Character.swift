//
//  Character.swift
//  EventRickyMorty
//
//  Created by AsifMacMini on 27/08/24.
//

import Foundation

struct Character: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String

    struct Location: Codable, Equatable {
        let name: String
        let url: String
    }
}
