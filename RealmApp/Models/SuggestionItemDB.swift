//
//  ShoppingItemDB.swift
//  RealmApp
//
//  Created by Magnus Ahlqvist on 2020-12-05.
//

import Foundation
import RealmSwift

class SuggestionItemDB: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var notes = ""
    @objc dynamic var boxed = false
    
    override class func primaryKey() -> String? {
        "id"
    }
}
