//
//  AddPersonView.swift
//  Red Flags
//
//  Created by Mohameth Seck on 4/28/24.
//
import SwiftUI
import SwiftData

struct AddPersonView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context: ModelContext

    @State private var name: String = ""
    @State private var age: String = ""
    @State private var city: String = ""
    @State private var height: Double = 5.0 // Default height value
    @State private var startDate = Date()

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal Details")) {
                    TextField("Enter the name of your date", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Enter the age", text: $age)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Enter the city", text: $city)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    HStack {
                        Text("Height")
                        Slider(value: $height, in: 4.0...7.0, step: 0.1)
                        Text("\(height, specifier: "%.1f") ft")
                    }
                }
                
                Section(header: Text("Relationship Details")) {
                    DatePicker(
                        "When did you start seeing each other?",
                        selection: $startDate,
                        displayedComponents: [.date]
                    )
                }
            }
            .navigationTitle("New Date")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: savePerson) {
                        Text("Save")
                            .font(.headline)
                            .padding()
                    }
                }
            }
        }
    }

    private func savePerson() {
        guard let age = Int(age) else {
            // Handle invalid input
            return
        }
        let newPerson = Person(id: UUID(), name: name, age: age, city: city, height: height, startDate: startDate, strikes: 0)
        context.insert(newPerson)
        dismiss()
    }
}

#Preview {
    AddPersonView()
}
