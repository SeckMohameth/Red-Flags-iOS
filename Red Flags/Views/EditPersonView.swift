//
//  EditPersonView.swift
//  Red Flags
//
//  Created by Mohameth Seck on 5/26/24.
//
import SwiftUI
import SwiftData

struct EditPersonView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @Binding var person: Person
    @State private var name: String = ""
    @State private var age: Double = 0
    @State private var city: String = ""
    @State private var height: Double = 0
    @State private var startDate: Date = Date()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("City", text: $city)
                    DatePicker("Start Date", selection: $startDate, displayedComponents: [.date])
                    HStack {
                        Text("Height")
                        Slider(value: $height, in: 4.0...7.0, step: 0.01) // Adjust the step to 0.01 for finer increments
                        Text("\(height, specifier: "%.2f")") // Display two decimal places
                    }
                    Stepper("Age: \(Int(age))", value: $age, in: 18...80)
                }
            }
            .onAppear {
                name = person.name
                age = Double(person.age)
                city = person.city
                height = person.height
                startDate = person.startDate
            }
            .navigationTitle("Edit Person")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(.purple)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        person.name = name
                        person.age = Int(age)
                        person.city = city
                        person.height = height
                        person.startDate = startDate
                        dismiss()
                    }
                    .tint(.purple)
                }
            }
        }
    }
}

#Preview {
    EditPersonView(person: .constant(Person(id: UUID(), name: "Sample Person", age: 25, city: "Sample City", height: 5.9, startDate: Date(), strikes: 0)))
}
