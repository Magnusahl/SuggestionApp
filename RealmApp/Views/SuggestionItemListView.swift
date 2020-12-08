//
//  ShoppingItemListView.swift
//  RealmApp
//
//  Created by Magnus Ahlqvist on 2020-12-07.
//

import SwiftUI

struct SuggestionItemListView: View {
    @EnvironmentObject var box: SuggestionsBox
    @State private var suggestionFormPresented = false
    let items: [SuggestionItem]
    let boughtItems: [SuggestionItem]
    
    var body: some View {
        List {
            Section {
               
                ForEach (items) { item in
                    SuggestionItemRow(suggestionItem: item)
                }
                
                newItemButton
            }
            
            Section(header: Text("Suggestions boxed")) {
                if boughtItems.isEmpty {
                    Text("Leave a suggestion and it will show here")
                }
                ForEach(boughtItems) { item in
                    SuggestionItemRow(suggestionItem: item)
                }.onDelete { indexSet in
                    if let idx = indexSet.first {
                        box.delete(itemId: boughtItems[idx].id)
                    }
                }
            }
        }.listStyle(GroupedListStyle())
        .navigationBarTitle("Suggestion Box")
    }
    
    var newItemButton: some View {
        Button(action: { suggestionFormPresented.toggle() }) {
            HStack {
                Image(systemName: "plus.circle.fill")
                
                Text("Add new suggestion")
                    .bold()
            }
        }.foregroundColor(.blue)
        .sheet(isPresented: $suggestionFormPresented) {
            SuggestionFormView(form: SuggestionForm()).environmentObject(box)
        }
    }
}

