//
//  ItemRowView.swift
//  QuickBite
//
//  Created by Bhaskara Padala on 11/12/24.
//

import SwiftUI

struct ItemRowView: View {
    let item: MenuItem
    let colors: [String: Color] = ["D" : .purple, "G" : .black, "N" : .red, "S" : .blue, "V" : .green]
    var body: some View {
        HStack
        {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(content: { Circle().stroke(Color.gray, lineWidth: .init(2)) })
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
                }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(5)
                    .background(Color(colors[restriction] ?? .gray))
                    .clipShape(Circle())
                    .foregroundStyle(.white)
                
            }
        }
    }
}

#Preview {
    ItemRowView(item: MenuItem.example)
}
