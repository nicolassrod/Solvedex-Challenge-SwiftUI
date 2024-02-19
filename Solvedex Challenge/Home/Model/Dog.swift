//
//  Dog.swift
//  Solvedex Challenge
//
//  Created by Nicolás A. Rodríguez on 14/02/24.
//

import Foundation

struct Dog: Identifiable {
    let id: UUID
    let image: URL
}

extension Dog: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
