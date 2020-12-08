//
//  ShoppingFormView.swift
//  RealmApp
//
//  Created by Magnus Ahlqvist on 2020-12-07.
//

import SwiftUI

struct SuggestionFormView: View {
    
    @EnvironmentObject var box: SuggestionsBox
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var form: SuggestionForm
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $form.title)
                
                Section(header: Text("Suggestions")) {
                    TextField("", text: $form.notes)
                }
            }
            .navigationBarTitle("Suggestion Form", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel", action: dismiss), trailing: Button(form.updating ? "Update" : "Save", action: save))
        }
    }
}

// Actions

extension SuggestionFormView {
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func save() {
        if form.updating, let id = form.suggestionItemId {
            box.updateItem(itemId: id, title: form.title, notes: form.notes)
        } else {
            box.create(title: form.title, notes: form.notes)
        }
        
        dismiss()
    }
}
