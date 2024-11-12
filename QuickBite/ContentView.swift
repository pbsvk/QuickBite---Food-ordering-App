//
//  ContentView.swift
//  QuickBite
//
//  Created by Bhaskara Padala on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(menu) { section in
                    Section(section.name)
                    {
                        ForEach(section.items)
                        {   item in
                            NavigationLink(value: item) {
                                ItemRowView(item: item)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetailView(item: item)
            }
                .navigationTitle("Menu")
                .listStyle(.grouped)
            }
        }
    
}

#Preview {
    ContentView()
}
