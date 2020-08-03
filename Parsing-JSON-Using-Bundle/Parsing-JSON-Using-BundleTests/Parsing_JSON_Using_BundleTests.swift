//
//  Parsing_JSON_Using_BundleTests.swift
//  Parsing-JSON-Using-BundleTests
//
//  Created by Pursuit on 8/3/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import XCTest
@testable import Parsing_JSON_Using_Bundle

class Parsing_JSON_Using_BundleTests: XCTestCase {
    
    // all of the functions need to start with the wordtest
    func testModel() {
        // arrange
        let jsonData = """
            [{
            "number": 1,
            "president": "George Washington",
            "birth_year": 1732,
            "death_year": 1799,
            "took_office": "1789-04-30",
            "left_office": "1797-03-04",
            "party": "No Party"
        }, {
            "number": 2,
            "president": "John Adams",
            "birth_year": 1735,
            "death_year": 1826,
            "took_office": "1797-03-04",
            "left_office": "1801-03-04",
            "party": "Federalist"
        }]
        """.data(using: .utf8)!
        
        let expectedFirstPresident = "George Washington"
        // act
        do {
            let president = try JSONDecoder().decode([President].self, from: jsonData)
            XCTAssertEqual(expectedFirstPresident, president[0].name)
        } catch {
            XCTFail("decodingError: \(error)")
        }
    }
    
    func testParsingJSONFromBundle(){
        // arrange
        let bundle = Bundle.main
        
        let filename = "presidents"
        
        let firstBlackPresident = "Barack Obama"
        
        // act
        // our function throws so its a do catch
        do {
            let presidents = try bundle.parsingJSON(with: filename)
            // xctassert
            XCTAssertEqual(firstBlackPresident, presidents[43].name)
        }catch {
            XCTFail("decoding error: \(error)")
        }
        // assert
    }
   

}
