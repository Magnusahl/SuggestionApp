//
//  RealmPersistenInit.swift
//  RealmApp
//
//  Created by Magnus Ahlqvist on 2020-12-05.
//

import SwiftUI
import RealmSwift

class RealmPersistent {
    static func initializer() -> Realm {
    do {
        let realm = try Realm()
    return realm
    } catch let err {
        fatalError("Failed to open Realm error: \(err.localizedDescription)")
    }
    }
}
