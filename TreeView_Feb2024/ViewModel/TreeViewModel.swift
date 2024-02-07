//
//  TreeViewModel.swift
//  TreeView_Feb2024
//
//  Created by mac on 07/02/24.
//

import Foundation

class TreeViewModel: ObservableObject {
    @Published var people: [Person] = []

    init() {
        loadPeople()
    }

    func loadPeople() {
        guard let url = Bundle.main.url(forResource: "people", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Failed to load JSON")
            return
        }

        do {
            let decodedPeople = try JSONDecoder().decode([Person].self, from: data)
            self.people = decodedPeople
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}

extension TreeViewModel {
    func toggleExpanded(for person: Person) {
        toggleExpandedRecursive(for: person, in: &people)
    }

    private func toggleExpandedRecursive(for person: Person, in people: inout [Person]) {
        for i in 0..<people.count {
                if let children = people[i].children, !children.isEmpty {
                if people[i].id == person.id {
                    people[i].isExpanded.toggle()
                    return
                }
                if !people[i].children!.isEmpty {
                    toggleExpandedRecursive(for: person, in: &people[i].children!)
                }
            }
        }
    }
}
