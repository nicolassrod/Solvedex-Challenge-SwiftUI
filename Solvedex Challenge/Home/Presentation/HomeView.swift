//
//  HomeView.swift
//  Solvedex Challenge
//
//  Created by Nicolás A. Rodríguez on 14/02/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(DogLoader.self) private var dogLoader: DogLoader
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(dogLoader.dogs) { dog in
                    HomeRowView(url: dog.image)
                        .task {
                            if dog == dogLoader.dogs.last {
                                await dogLoader.load()
                            }
                        }
                }
            }
            .navigationTitle("Pugs")
            .listStyle(.inset)
            .listRowSpacing(30)
            .task {
                await dogLoader.load(restart: true)
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(DogLoader(dogService: DogService()))
}
