//
//  ContentView.swift
//  EventRickyMorty
//
//  Created by AsifMacMini on 27/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CharacterViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(2)
                        .padding()
                } else if viewModel.characters.isEmpty {
                    Text("No characters available")
                        .padding()
                        .font(.headline)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(viewModel.characters) { character in
                                NavigationLink(destination: CharacterDetailView(character: character)) {
                                    CharacterCardView(character: character)
                                        .padding(.horizontal)
                                        .transition(.scale)
                                        .animation(.spring(), value: viewModel.characters)
                                }
                            }
                        }
                        .padding(.top)
                    }
                }
            }
            .navigationTitle("Rick and Morty Characters")
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}

