//
//  ContentView.swift
//  QuickBite
//
//  Created by Bhaskara Padala on 11/12/24.
//
import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    @State private var isProfilePresented = false // State to control the sheet presentation
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isProfilePresented.toggle() // Show the profile modal when tapped
                    }) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
            }
            .listStyle(.grouped)
            .sheet(isPresented: $isProfilePresented) {
                UserProfileView() // The view that will appear as a sheet
            }
        }
    }
}

#Preview {
    ContentView()
}
