//
//  DogLoader.swift
//  Solvedex Challenge
//
//  Created by Nicolás A. Rodríguez on 14/02/24.
//

import Foundation

@Observable
class DogLoader {
    private let limit = 10
    private var dogService: DogService
    
    var dogs: [Dog] = []
    
    init(dogService: DogService) {
        self.dogService = dogService
    }
    
    @MainActor
    func load(restart: Bool = false) async {
        if restart {
            dogs.removeAll()
        }
        
        do {
            let dogs = try await dogService.getDogs(limit: limit).map { url in
                Dog(id: UUID(), image: url)
            }
            self.dogs.append(contentsOf: dogs)
        } catch {
            print("error: ", error)
        }
    }
}
