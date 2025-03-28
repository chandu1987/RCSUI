//
//  UserDefaults.swift
//  RCSUI
//
//  Created by Chandra Sekhar Ravi on 2025-03-28.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let defaults = UserDefaults.standard
    
    private init() {} // Prevent instantiation outside

    // Save data
    func set<T: Codable>(_ value: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(value) {
            defaults.set(data, forKey: key)
        }
    }

    // Retrieve data
    func get<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        guard let data = defaults.data(forKey: key),
              let value = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return value
    }

    // Remove data
    func remove(forKey key: String) {
        defaults.removeObject(forKey: key)
    }

    // Check if a key exists
    func contains(_ key: String) -> Bool {
        return defaults.object(forKey: key) != nil
    }
}
