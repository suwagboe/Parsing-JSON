//
//  Bundle+ParsingJSON.swift
//  Parsing-JSON-Using-Bundle
//
//  Created by Pursuit on 8/3/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation

enum BundleError: Error{
   case invalidResource(String) // this is for the path error
    case noContents(String) // this is for the data wiht filemanager
    case decodingError(Error)
}

extension Bundle {
    
    // 1 - get the path of the file to be read using the bundle class = the string is the path
    //2 - using the path read its contents => Data?
    
    // this function will be a throwing function
    // to use throwing function you have to use try? or do {} catch {} or try!
    func parsingJSON(with name: String) throws -> [President] {
        guard let path  = Bundle.main.path(forResource: name, ofType: ".json") else {
            // MARK: should no longer be using print statements for where errors could occur
            throw BundleError.invalidResource(name)
        }
        
        
        guard let data = FileManager.default.contents(atPath: path) else {
            throw BundleError.noContents(path)
        }
        
        var presidents: [President]
        
        do {
            presidents = try JSONDecoder().decode([President].self, from: data)
        } catch {
            throw BundleError.decodingError(error)
        }
        
        return presidents
        
    }
    
    
}
