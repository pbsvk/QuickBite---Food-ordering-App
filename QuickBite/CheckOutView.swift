//
//  CheckOutView.swift
//  QuickBite
//
//  Created by Bhaskara Padala on 11/12/24.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order: Order
    private let paymentTypes = ["Cash", "Credit Card", "QB coins"]
    @State private var paymentType: String = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount: Int = 15
    @State private var showingpaymentAlert = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total/100 * Double(tipAmount)
        return(total + tipValue).formatted(.currency(code: "USD"))
        
    }
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay? ", selection: $paymentType)
                {
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                    }
                }
                Toggle("Add QB loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your QB loyalty card number", text: $loyaltyNumber)
                }
            }
            
            Section("Add a tip"){
                Picker("Tip Amount", selection: $tipAmount){
                    ForEach(tipAmounts, id: \.self){
                        Text("\($0)%")
                    }
                }.pickerStyle(.segmented)
            }
            
            Section("Review Order"){
                
                HStack {
                    Text("Total: \(totalPrice)")
                    Spacer()
                    Button("Place Order"){
                        showingpaymentAlert.toggle()
                    }
                }
                
            }
        }.navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Order Confirmed", isPresented: $showingpaymentAlert){
                
            } message: {
                Text("Your total was \(totalPrice). Thank You")
                
            }
    }
}

#Preview {
    CheckOutView()
        .environmentObject(Order())
}
