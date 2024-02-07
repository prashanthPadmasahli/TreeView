//
//  Person.swift
//  TreeView_Feb2024
//
//  Created by mac on 07/02/24.
//

import Foundation

struct Person: Identifiable, Decodable {
    var id: Int
    var name: String
    var children: [Person]?

    var isExpanded: Bool = false
    var hasChildren: Bool {
        children != nil && !children!.isEmpty
    }

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case children = "Children"
    }
}
