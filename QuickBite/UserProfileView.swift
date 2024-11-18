//
//  UserProfileView.swift
//  QuickBite
//
//  Created by Bhaskara Padala on 11/17/24.
//

import SwiftUI

// Your imports remain the same

struct UserProfileView: View {
    @Environment(\.presentationMode) var presentationMode // Add this line
    
    var body: some View {
        VStack {
            Text("User Profile Content")
                .font(.largeTitle)
        }
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    presentationMode.wrappedValue.dismiss() // Dismiss the sheet
                }
            }
            
        }
    }
}

#Preview {
    UserProfileView()
}
