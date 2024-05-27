//
//  ContentView.swift
//  Red Flags
//
//  Created by Mohameth Seck on 4/28/24.
//
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Person.name) private var dates: [Person]
    
    @State private var showAddDate = false
    @State private var showEditSheet = false
    @State private var selectedDate: Person?

    var body: some View {
        NavigationStack {
            List {
                ForEach(dates) { person in
                    NavigationLink(destination: PersonView(person: person)) {
                        DateCardView(person: person)
                    }
                    .listRowSeparator(.hidden)
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            selectedDate = person
                            showEditSheet = true
                        } label: {
                            HStack {
                                Image(systemName: "pencil")
                                Text("Edit")
                            }
                        }
                        .tint(.blue)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(.plain)
            .navigationTitle("My Dates")
            .sheet(item: $selectedDate) { person in
                EditPersonView(person: Binding(
                    get: { selectedDate ?? person },
                    set: { selectedDate = $0 }
                ))
            }
            .sheet(isPresented: $showAddDate) {
                AddPersonView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddDate = true
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                    .tint(.purple)
                }
            }
        }
        .tint(.purple)
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(dates[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Person.self, inMemory: true)
}
