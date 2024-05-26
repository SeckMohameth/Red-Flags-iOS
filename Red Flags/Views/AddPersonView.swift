//
//  AddPersonView.swift
//  Red Flags
//
//  Created by Mohameth Seck on 4/28/24.
//

import SwiftUI

struct AddPersonView: View {
    @Environment(\.modelContext) private var context
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var startDate = Date()
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                
                Text("Name")
                TextField("Enter the name of your date", text: $name)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                    )
                Spacer()
                DatePicker(
                    "When did you start seeing each other?",
                    selection: $startDate,
                    displayedComponents: [.date]
                )
                Spacer()
                
            }
            .padding()
            .navigationTitle("New Date")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
//                        let newDate = Person(name: name, startDate: startDate)
//                        context.insert(newDate)
                    }) {
                        Text("Save")
                            .font(.headline)
                            .padding()
                    }
                }
            }
        }
    }
    
}

#Preview {
    AddPersonView()
}
