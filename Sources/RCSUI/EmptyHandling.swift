//
//  EmptyHandling.swift
//  RCSUI
//
//  Created by Chandra Sekhar Ravi on 2025-03-24.
//

import Foundation

public extension Collection {
    func nilOrEmpty() -> Self? {
        return isEmpty ? nil : self
    }
}

public extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        guard let collection = self else {
            return true
        }
        
        return collection.isEmpty
    }
}

public protocol EmptyValueRepresentable {
    static var emptyValue: Self { get }
}

extension Array: EmptyValueRepresentable {
    public static var emptyValue: Array<Element> {
        return []
    }
}

extension Dictionary: EmptyValueRepresentable {
    public static var emptyValue: Dictionary<Key, Value> {
        return [:]
    }
}

extension Set: EmptyValueRepresentable {
    public static var emptyValue: Set<Element> {
        return Set()
    }
}

extension String: EmptyValueRepresentable {
    public static var emptyValue: String {
        return ""
    }
}

public extension Optional where Wrapped: EmptyValueRepresentable {
    func orEmpty() -> Wrapped {
        return or(Wrapped.emptyValue)
    }
}
