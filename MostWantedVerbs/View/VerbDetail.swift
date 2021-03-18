//
//  VerbDetail.swift
//  FrenchZarisovki
//
//  Created by Ivan Liutko on 27.09.2020.
//

import SwiftUI

struct VerbDetail: View {
    var conjugaison: Array<VerbForm>
    
    // MARK: - properties

    
    var body: some View {
        VStack {
            ForEach(conjugaison) { item in
                Text("\(item.person) \(item.form)")
            }
        } //: VSTACK
        .onAppear {
            conjugaison.forEach {
                print($0)
            }
            Person.allCases.forEach {
                print("[allCases] \($0)")
            }
        }
    
    }
}

struct VerbDetail_Previews: PreviewProvider {
    static var previews: some View {
        VerbDetail(conjugaison: verbsData[0].conjugaison)
    }
}
