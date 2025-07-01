//
//  Observation.swift
//  Flycatcher App
//
//  Created by Qhelani Moyo on 7/1/25.
//

import Foundation

struct Observation: Codable, Identifiable {
    var id: UUID { UUID() }  // For SwiftUI lists
    
    let speciesCode: String
    let comName: String
    let sciName: String
    let obsDt: String
    let lat: Double
    let lng: Double
    let howMany: Int?
    let locName: String
}
