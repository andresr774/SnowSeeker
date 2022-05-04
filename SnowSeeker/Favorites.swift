//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Andres camilo Raigoza misas on 4/05/22.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    private let saveKey = "Favorites"
    
    let saveUrl = FileManager.default.documentsDirectory.appendingPathComponent("Favorites")
    
    init() {
        do {
            resorts = try FileManager.default.decode(from: saveUrl)
        } catch {
            print("Error getting data from documents directory: \(error.localizedDescription)")
            resorts = []
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        FileManager.default.save(resorts, to: saveUrl)
    }
}
