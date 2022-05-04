//
//  FileManager-Decodable.swift
//  SnowSeeker
//
//  Created by Andres camilo Raigoza misas on 4/05/22.
//

import Foundation

extension FileManager {
    var documentsDirectory: URL {
        let paths = self.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func decode<T:Decodable>(from url: URL) throws -> T {
        let data = try Data(contentsOf: url)
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
    
    func save<T:Encodable>(_ items: T, to url: URL) {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: url)
        } catch {
            print("Error saving data in path \(error.localizedDescription)")
        }
    }
}
