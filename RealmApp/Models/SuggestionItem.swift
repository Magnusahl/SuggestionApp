//
//  ShoppingItem.swift
//  RealmApp
//
//  Created by Magnus Ahlqvist on 2020-12-05.
//

import SwiftUI

struct SuggestionItem: Identifiable {
    let id: Int
    let title: String
    let notes: String
    let boxed: Bool
}

// init

extension SuggestionItem {
    init(shoppingItemDb: SuggestionItemDB) {
        id = shoppingItemDb.id
        title = shoppingItemDb.title
        notes = shoppingItemDb.notes
        boxed = shoppingItemDb.boxed
    }
}
