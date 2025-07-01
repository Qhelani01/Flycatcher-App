//
//  Config.swift
//  Flycatcher App
//
//  Created by Qhelani Moyo on 7/1/25.
//

import Foundation

struct Config {
    static var ebirdApiKey: String {
        guard let filePath = Bundle.main.path(forResource: "Secrets", ofType: "plist") else {
            fatalError("Couldn't find Secrets.plist.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "EBIRD_API_KEY") as? String else {
            fatalError("API Key not found in Secrets.plist")
        }
        return value
    }
}
