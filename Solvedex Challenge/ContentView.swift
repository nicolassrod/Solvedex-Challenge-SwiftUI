//
//  ContentView.swift
//  Solvedex Challenge
//
//  Created by Nicolás A. Rodríguez on 14/02/24.
//

import SwiftUI

struct ContentView: View {
    @State var dogLoader = DogLoader(dogService: DogService())
    
    var body: some View {
        HomeView()
            .environment(dogLoader)
    }
}

#Preview {
    ContentView()
}
