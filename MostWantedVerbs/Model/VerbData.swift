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
    let conjugaison: Array<VerbForm>
}

struct VerbForm: Codable {
    let person: String
    let form: String
}

enum Person: String, CaseIterable {
    case je, tu, il, nous, vous, ils
}
