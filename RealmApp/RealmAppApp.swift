//
//  RealmAppApp.swift
//  RealmApp
//
//  Created by Magnus Ahlqvist on 2020-12-04.
//

import SwiftUI

@main
struct RealmAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(SuggestionsBox(realm: RealmPersistent.initializer()))
        }
    }
}
