//
//  CharacterViewModel.swift
//  EventRickyMorty
//
//  Created by AsifMacMini on 27/08/24.
//

import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    private let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol = CharacterRepository()) {
        self.repository = repository
    }

    func fetchCharacters() {
        isLoading = true
        repository.fetchCharacters()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.isLoading = false
                if case let .failure(error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { characters in
                self.characters = characters
            }
            .store(in: &cancellables)
    }
}
