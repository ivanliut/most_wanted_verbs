//
//  ContentView.swift
//  MostWantedVerbs
//
//  Created by Ivan Liutko on 06.01.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var verbsData: VerbsData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(verbsData.verbs) { verb in
                    
                    NavigationLink(
                        destination: VerbDetail(conjugaison: verb.conjugaison)) {
                        Text(verb.name)
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
