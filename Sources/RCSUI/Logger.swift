//
//  Logger.swift
//  RCSUI
//
//  Created by Chandra Sekhar Ravi on 2025-07-17.
//

import Foundation

public final class Logger {
    // Prevent instantiation
    private init() {}

    /// Standard log message (only in DEBUG)
    static func log(_ message: @autoclosure () -> String,
                    file: String = #file,
                    function: String = #function,
                    line: Int = #line) {
        #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("📍[\(fileName):\(line)] \(function) ▶︎ \(message())")
        #endif
    }

    /// Pretty prints Data (e.g. from API response) if it's valid JSON
    static func prettyPrint(_ data: Data,
                            file: String = #file,
                            function: String = #function,
                            line: Int = #line) {
        #if DEBUG
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            let prettyData = try JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
            if let prettyString = String(data: prettyData, encoding: .utf8) {
                log(prettyString, file: file, function: function, line: line)
            }
        } catch {
            log("⚠️ Failed to pretty print JSON: \(error.localizedDescription)", file: file, function: function, line: line)
        }
        #endif
    }
}
