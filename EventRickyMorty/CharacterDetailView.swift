//
//  CharacterDetailView.swift
//  EventRickyMorty
//
//  Created by AsifMacMini on 27/08/24.
//

import Foundation

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    @Namespace private var animationNamespace

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding()
                        .transition(.slide)
                        .animation(.easeInOut)
                        .matchedGeometryEffect(id: "image\(character.id)", in: animationNamespace)
                } placeholder: {
                    ProgressView()
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text(character.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .matchedGeometryEffect(id: "name\(character.id)", in: animationNamespace)

                    HStack {
                        Text("Species:")
                            .font(.headline)
                        Text(character.species)
                            .font(.subheadline)
                    }

                    HStack {
                        Text("Status:")
                            .font(.headline)
                        Text(character.status)
                            .font(.subheadline)
                            .foregroundColor(character.status == "Alive" ? .green : .red)
                    }

                    HStack {
                        Text("Gender:")
                            .font(.headline)
                        Text(character.gender)
                            .font(.subheadline)
                    }

                    HStack {
                        Text("Origin:")
                            .font(.headline)
                        Text(character.origin.name)
                            .font(.subheadline)
                    }

                    HStack {
                        Text("Location:")
                            .font(.headline)
                        Text(character.location.name)
                            .font(.subheadline)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
