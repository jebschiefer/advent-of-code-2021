//
//  Utility.swift
//  advent-of-code-2021
//
//  Created by Jeb Schiefer on 12/6/21.
//

import Foundation

class Utility {
    
    
    /// Reads a file from the InputFiles bundle.
    /// - Parameter name: The filename without  extension
    /// - Returns: The file contents if found. Nil if file could not be read.
    static func readFile(name: String) -> String? {
        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let bundleURL = URL(fileURLWithPath: "InputFiles.bundle", relativeTo: currentDirectoryURL)
        
        if let bundle = Bundle(url: bundleURL) {
            if let inputFileUrl = bundle.url(forResource: name, withExtension: "txt") {
                do {
                    let contents = try String(contentsOfFile: inputFileUrl.path)
                    return contents
                }
                catch let error as NSError {
                    print("Error reading file: \(error)")
                }
            }
        }
        
        return nil
    }
    
}
