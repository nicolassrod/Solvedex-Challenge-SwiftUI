//
//  DogServiceTest.swift
//  Solvedex ChallengeTests
//
//  Created by Nicolás A. Rodríguez on 14/02/24.
//

import Foundation
import XCTest

final class DogServiceTest: XCTestCase {
    let pugURL = URL.randomPug(limit: 10)
    
    func testURLConstruction() {
        XCTAssertEqual(URL.randomPug(limit: 10), URL(string: "https://dog.ceo/api/breed/pug/images/random/10")!)
        XCTAssertEqual(URL.randomPug(limit: 0), URL(string: "https://dog.ceo/api/breed/pug/images/random/0")!)
    }
    
    func testResponseDecodable() async throws {
        let (data, response) = try await URLSession.shared.data(from: pugURL)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            XCTFail("No 200 Status Code: \(response)")
            return
        }
        
        guard let _ = try? JSONDecoder().decode(DogResponse.self, from: data) else {
            XCTFail("Can't decode the response with: DogResponse.self")
            return
        }
    }
    
    func testDogService() async {
        let dogService = DogService()
        do {
            let result = try await dogService.getDogs(limit: 5)
            XCTAssertEqual(result.count, 5)
        } catch {
            XCTFail("Unexpected Error: \(error)")
        }
    }
}
