//
//  HomeRowView.swift
//  Solvedex Challenge
//
//  Created by Nicolás A. Rodríguez on 14/02/24.
//

import SwiftUI
import CachedAsyncImage

struct HomeRowView: View {
    let url: URL
    
    @State private var likes: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            CachedAsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .containerRelativeFrame(.horizontal) { size, _ in
                        size * 1
                    }
                    .clipped()
            } placeholder: {
                Label(
                    title: { Text("Loading") },
                    icon: { ProgressView().progressViewStyle(.circular) }
                )
                .foregroundStyle(.red)
                .tint(.red)
                .frame(maxWidth: .infinity, minHeight: 200)
            }
            
            Button {
                likes += 1
            } label: {
                Text(
                    """
                    \(Text(Image(systemName: likes > 0 ? "heart.fill" : "heart")).textScale(.default)) \
                    \(Text("^[\(likes) like](inflect: true)"))
                    """
                )
                .contentTransition(.numericText())
                .animation(.smooth, value: likes)
            }
            .buttonStyle(.bordered)
            .controlSize(.regular)
            .padding()
            .foregroundStyle(.red)
        }
    }
    
}

#Preview {
    HomeRowView(url: URL(string: "https://images.dog.ceo/breeds/pug/lupita_and_cats.jpg")!)
        .frame(width: 100, height: 400)
}
