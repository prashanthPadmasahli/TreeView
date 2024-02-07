//
//  PersonView.swift
//  TreeView_Feb2024
//
//  Created by mac on 07/02/24.
//

import SwiftUI

struct PersonView: View {
    var person: Person
    var viewModel: TreeViewModel
    var leadingOffset: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                if person.hasChildren {
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(person.isExpanded ? 0 : -90))
                        .animation(.none, value: person.isExpanded)
                } else {
                    Image(systemName: "smallcircle.filled.circle")
                }
                Text(person.name)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.toggleExpanded(for: person)
            }
            .padding(.leading, leadingOffset)
            .padding(.vertical, 4)

            if person.isExpanded, let children = person.children {
                ForEach(children) { child in
                    PersonView(person: child, viewModel: viewModel, leadingOffset: leadingOffset + 12)
                }
            }
        }
    }
}

//struct PersonView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonView()
//    }
//}
