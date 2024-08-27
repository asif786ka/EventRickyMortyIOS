//
//  CharacterRepository.swift
//  EventRickyMorty
//
//  Created by AsifMacMini on 27/08/24.
//

import Foundation
import Combine

protocol CharacterRepositoryProtocol {
    func fetchCharacters() -> AnyPublisher<[Character], Error>
}

class CharacterRepository: CharacterRepositoryProtocol {
    func fetchCharacters() -> AnyPublisher<[Character], Error> {
        let urlString = "\(APIConstants.baseURL)character/"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: CharacterResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .eraseToAnyPublisher()
    }
}

struct CharacterResponse: Codable {
    let results: [Character]
}
