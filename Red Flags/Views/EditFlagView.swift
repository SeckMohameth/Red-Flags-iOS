//
//  EditFlagView.swift
//  Red Flags
//
//  Created by Mohameth Seck on 5/26/24.
//

import SwiftUI
import SwiftData

struct EditFlagView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @Binding var flag: Flag
    @State private var detail: String
    @State private var isGreenFlag: Bool

    init(flag: Binding<Flag>) {
        _flag = flag
        _detail = State(initialValue: flag.wrappedValue.detail)
        _isGreenFlag = State(initialValue: flag.wrappedValue.isGreenFlag)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Description", text: $detail)
                    Toggle("Red Flag", isOn: $isGreenFlag)
                }
            }
            .navigationTitle("Edit Flag")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        flag.detail = detail
                        flag.isGreenFlag = isGreenFlag
                        dismiss()
                    }
                }
            }
        }
    }
}
