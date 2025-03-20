//
//  OptionalExtension.swift
//  RCSUI
//
//  Created by Chandra Sekhar Ravi on 2025-03-20.
//

/// Extension for Optional enum implementing helper functions
public extension Optional {
    /// Return true if optional state is 'none AKA nil
    var isNone: Bool {return self == nil}
    
    /// Return true if optional state is ' none' AKA nil
    var isNil: Bool { return self == nil }
    
    /// Return true if optional state is' some
    var isSome: Bool {return self != nil}
    
    func then(_handler: (Wrapped) -> Void) {
        switch self {
        case .some(let value):
            _handler(value)
        default:
            break
        }
    }
    
    func or(_ defaultValue: Wrapped) -> Wrapped {
        guard let value = self else {
            return defaultValue
        }
        return value
    }
}
