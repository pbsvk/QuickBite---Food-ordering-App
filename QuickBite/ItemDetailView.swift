//
//  ItemDetailView.swift
//  QuickBite
//
//  Created by Bhaskara Padala on 11/12/24.
//

import SwiftUI

struct ItemDetailView: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    var body: some View {
        VStack {
            ZStack(alignment : .bottomTrailing)
            {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo by \(item.photoCredit)")
                    .padding(4)
                    .font(.caption)
                    .background(Color.black)
                    .foregroundColor(.white)
                    
            }
            Text(item.description)
                .padding()
            
            Button("Order") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            
            
Spacer()
        }.navigationTitle(item.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ItemDetailView(item: MenuItem.example).environmentObject(Order())
    }
    
}
