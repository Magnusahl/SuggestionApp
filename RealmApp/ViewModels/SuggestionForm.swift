//
//  ShoppingForm.swift
//  RealmApp
//
//  Created by Magnus Ahlqvist on 2020-12-07.
//

import SwiftUI

class SuggestionForm: ObservableObject {
    @Published var title = ""
    @Published var notes = ""
    
    var suggestionItemId: Int?
    
    var updating: Bool {
        suggestionItemId != nil
    }
    
    init() {}
    
    init(_ suggestionItem: SuggestionItem) {
        suggestionItemId = suggestionItem.id
        title = suggestionItem.title
        notes = suggestionItem.notes
    }
}
