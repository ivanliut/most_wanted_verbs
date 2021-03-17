//
//  VerbsData.swift
//  FrenchZarisovki
//
//  Created by Ivan Liutko on 26.09.2020.
//

import Combine
import SwiftUI

final class VerbsData: ObservableObject {
    @Published var verbs: [VerbData] = verbsData
}
