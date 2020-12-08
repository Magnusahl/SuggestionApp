//
//  ShoppingItemRow.swift
//  RealmApp
//
//  Created by Magnus Ahlqvist on 2020-12-07.
//

import SwiftUI

struct SuggestionItemRow: View {
    @EnvironmentObject var box: SuggestionsBox
    @State private var suggestionFormPresented = false
    let suggestionItem: SuggestionItem
    
    var body: some View {
        HStack {
            Button(action: openUpdate) {
                
                VStack(alignment: .leading) {
                    Text(suggestionItem.title)
                        .font(.headline)
                    
                    Text(suggestionItem.notes)
                        .font(.subheadline)
                        .lineLimit(1)
                }
            }.buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $suggestionFormPresented) {
                SuggestionFormView(form: SuggestionForm(self.suggestionItem))
                    .environmentObject(self.box)
            }
            Spacer()
            Button(action: buyItem) {
                Circle().fill(Color.blue).frame(width: 20, height: 20)
            }
        }
    }
}

//Actions

extension SuggestionItemRow {
    func openUpdate() {
        if !suggestionItem.boxed {
            suggestionFormPresented.toggle()
        }
    }
    
    func buyItem() {
        withAnimation {
            if !suggestionItem.boxed {
                box.updateBuy(suggestionItem: suggestionItem)
            }
        }
    }
}
