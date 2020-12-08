//
//  ContentView.swift
//  RealmApp
//
//  Created by Magnus Ahlqvist on 2020-12-04.
//

import SwiftUI
import RealmSwift


struct ContentView: View {
    @EnvironmentObject var box: SuggestionsBox
    
    var body: some View {
        NavigationView {
            SuggestionItemListView(items: box.items, boughtItems: box.boxedItem)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
   

}
