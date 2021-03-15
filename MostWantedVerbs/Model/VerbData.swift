//
//  VerbData.swift
//  FrenchZarisovki
//
//  Created by Ivan Liutko on 26.09.2020.
//

import Foundation

struct VerbData: Codable, Identifiable {
    let id: Int
    let name: String
    let conjugaison: Dictionary<String, String>
}

enum Person: String, CaseIterable {
    case je, tu, il, nous, vous, ils
}
