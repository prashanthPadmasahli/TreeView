//
//  ContentView.swift
//  TreeView_Feb2024
//
//  Created by mac on 07/02/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TreeViewModel()
    
    var body: some View {
        List(viewModel.people, id: \.id) { person in
            PersonView(person: person, viewModel: viewModel, leadingOffset: 16)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
