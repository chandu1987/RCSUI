//
//  UIImage+Extensions.swift
//  RCSUI
//
//  Created by Chandra Sekhar Ravi on 2025-08-22.
//

import UIKit
import Foundation

public extension UIImage {
    /// Converts the UIImage to a Base64-encoded string in JPEG format
    /// - Parameter compressionQuality: JPEG compression quality from 0.0 to 1.0 (default is 1.0)
    /// - Returns: Base64 string representation of the image or nil if encoding fails
    public func toBase64(compressionQuality: CGFloat = 1.0) -> String? {
        guard let imageData = self.jpegData(compressionQuality: compressionQuality) else {
            return nil
        }
        
        return imageData.base64EncodedString()
    }
}
