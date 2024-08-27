//
//  CharacterCardView.swift
//  EventRickyMorty
//
//  Created by AsifMacMini on 27/08/24.
//

import Foundation
import SwiftUI

struct CharacterCardView: View {
    let character: Character
    @State private var scale: CGFloat = 0.9
    @State private var rotation: Double = 10

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
                    .animation(
                        .easeInOut(duration: 0.5)
                            .repeatCount(1, autoreverses: true),
                        value: scale
                    )
                    .onAppear {
                        scale = 1.0
                        rotation = 0
                    }
            } placeholder: {
                ProgressView()
            }

            Text(character.name)
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.primary)

            Text(character.species)
                .font(.system(.subheadline, design: .rounded))
                .foregroundColor(.secondary)

            Text(character.status)
                .font(.system(.subheadline, design: .rounded))
                .foregroundColor(character.status == "Alive" ? .green : .red)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
        .scaleEffect(scale)
        .rotationEffect(.degrees(rotation))
        .animation(
            .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.5),
            value: scale
        )
    }
}
