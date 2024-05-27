//
//  AddFlagView.swift
//  Red Flags
//
//  Created by Mohameth Seck on 5/26/24.
//
import SwiftUI
import SwiftData

struct AddFlagView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context: ModelContext
    
    var person: Person

    @State private var title: String = ""
    @State private var detail: String = ""
    @State private var isGreen: Bool = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Flag Details")) {
                    TextField("Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextEditor(text: $detail)
                        .frame(height: 100)
                        .border(Color.gray, width: 1)
                    
                    Toggle("Is Green Flag", isOn: $isGreen)
                }
            }
            .navigationTitle("Add Flag")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: saveFlag) {
                        Text("Save")
                            .font(.headline)
                            .padding()
                    }
                }
            }
        }
    }

    private func saveFlag() {
        let newFlag = Flag(title: title, detail: detail, isGreenFlag: isGreen, timeStamp: Date(), person: person)
        context.insert(newFlag)
        person.flags?.append(newFlag)
        dismiss()
    }
}

#Preview {
    AddFlagView(person: Person(id: UUID(), name: "Sample Person", age: 30, city: "Sample City", height: 6.0, startDate: Date(), strikes: 0))
}
