//
//  VerbDetail.swift
//  FrenchZarisovki
//
//  Created by Ivan Liutko on 27.09.2020.
//

import SwiftUI

struct VerbDetail: View {
    var conjugaison: Dictionary<String, String>
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.orange)
                .padding()
            VStack {
                Text(conjugaison["je"] ?? "Hello, World!")
                Text(conjugaison["tu"] ?? "Hello, World!")
                Text(conjugaison["elle"] ?? "Hello, World!")
                Text(conjugaison["nous"] ?? "Hello, World!")
                Text(conjugaison["vous"] ?? "Hello, World!")
                Text(conjugaison["elles"] ?? "Hello, World!")
            
            }
        }
    
    }
}

struct VerbDetail_Previews: PreviewProvider {
    static var previews: some View {
        VerbDetail(conjugaison: verbsData[0].conjugaison)
    }
}
