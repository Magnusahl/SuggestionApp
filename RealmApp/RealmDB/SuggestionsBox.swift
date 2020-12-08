//
//  ShoppingStore.swift
//  RealmApp
//
//  Created by Magnus Ahlqvist on 2020-12-05.
//

import Foundation
import RealmSwift

final class SuggestionsBox: ObservableObject {
    private var itemResults: Results<SuggestionItemDB>
    private var boxedItemResults: Results<SuggestionItemDB>
    
    var items: [SuggestionItem] {
        itemResults.map(SuggestionItem.init)
    }
    
    var boxedItem: [SuggestionItem] {
        boxedItemResults.map(SuggestionItem.init)
    }
    
    init(realm: Realm) {
        itemResults = realm.objects(SuggestionItemDB.self).filter("boxed = false")
        boxedItemResults = realm.objects(SuggestionItemDB.self).filter("boxed = true")
    }
}

// CRUD operations

extension SuggestionsBox {
    func create(title: String, notes: String) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            let suggestionItemDB = SuggestionItemDB()
            suggestionItemDB.id = UUID().hashValue
            suggestionItemDB.title = title
            suggestionItemDB.notes = notes
            
            try realm.write {
                realm.add(suggestionItemDB)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func updateBuy(suggestionItem: SuggestionItem) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(
                    SuggestionItemDB.self,
                    value: [
                        SuggestionItemDbKeys.id.rawValue: suggestionItem.id,
                        SuggestionItemDbKeys.boxed.rawValue: !suggestionItem.boxed
                    ],
                    update: .modified)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }

    func updateItem(itemId: Int, title: String, notes: String) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(
                    SuggestionItemDB.self,
                    value: [
                        SuggestionItemDbKeys.id.rawValue: itemId,
                        SuggestionItemDbKeys.title.rawValue: title,
                        SuggestionItemDbKeys.notes.rawValue: notes
                    ],
                    update: .modified)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func delete(itemId: Int) {
        objectWillChange.send()
        
        guard let shoppingItemDB = boxedItemResults.first (where: {$0.id == itemId}) else {
            return
        }
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(shoppingItemDB)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
}

