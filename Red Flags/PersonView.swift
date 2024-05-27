//
//  FlagsView.swift
//  Red Flags
//
//  Created by Mohameth Seck on 4/29/24.
//
import SwiftUI

struct PersonView: View {
    var person: Person
    
    @State private var selectedTab = 0
    @State private var showAddFlag = false

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Height: \(person.height, specifier: "%.1f")")
                    Spacer()
                    Text("City: \(person.city)")
                    Spacer()
                    Text("Age: \(person.age)")
                }
                .padding(.horizontal)
                
                // Custom Tabs
                HStack(spacing: 20) {
                    Button(action: {
                        selectedTab = 0
                    }) {
                        Text("Green flags")
                            .foregroundColor(selectedTab == 0 ? .white : .black)
                            .padding()
                            .background(selectedTab == 0 ? Color.green : Color.gray.opacity(0.2))
                            .cornerRadius(15)
                    }
                    Button(action: {
                        selectedTab = 1
                    }) {
                        Text("Red flags")
                            .foregroundColor(selectedTab == 1 ? .white : .black)
                            .padding()
                            .background(selectedTab == 1 ? Color.red : Color.gray.opacity(0.2))
                            .cornerRadius(15)
                    }
                }
                .padding([.leading, .trailing])
                
                ScrollView {
                    if selectedTab == 0 {
                        if let flags = person.flags {
                            GreenFlagsView(flags: Binding(
                                get: { flags },
                                set: { person.flags = $0 }
                            ))
                        }
                    } else {
                        if let flags = person.flags {
                            RedFlagsView(flags: Binding(
                                get: { flags },
                                set: { person.flags = $0 }
                            ))
                        }
                    }
                }
                
                Button(action: {
                    showAddFlag = true
                }) {
                    Text("Add Flag")
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showAddFlag) {
                    AddFlagView(person: person)
                }
            }
            .navigationTitle(person.name)
        }
    }
}

struct GreenFlagsView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var flags: [Flag]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(flags.filter { $0.isGreenFlag }) { flag in
                HStack {
                    Image(systemName: "flag.fill")
                        .foregroundColor(.green)
                        .frame(width: 30, height: 30)
                    VStack(alignment: .leading) {
                        Text(flag.title)
                            .font(.headline)
                        Text(flag.detail)
                            .font(.subheadline)
                    }
                    Spacer()
                    Button(action: {
                        deleteFlag(flag)
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .imageScale(.large)
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        deleteFlag(flag)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
        .padding()
    }
    
    private func deleteFlag(_ flag: Flag) {
        withAnimation {
            modelContext.delete(flag)
            try? modelContext.save() // Save changes to the context
            flags.removeAll { $0.id == flag.id } // Immediately update the state
        }
    }
}

struct RedFlagsView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var flags: [Flag]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(flags.filter { !$0.isGreenFlag }) { flag in
                HStack {
                    Image(systemName: "flag.fill")
                        .foregroundColor(.red)
                        .frame(width: 30, height: 30)
                    VStack(alignment: .leading) {
                        Text(flag.title)
                            .font(.headline)
                        Text(flag.detail)
                            .font(.subheadline)
                    }
                    Spacer()
                    Button(action: {
                        deleteFlag(flag)
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .imageScale(.large)
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        deleteFlag(flag)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
        .padding()
    }
    
    private func deleteFlag(_ flag: Flag) {
        withAnimation {
            modelContext.delete(flag)
            try? modelContext.save() // Save changes to the context
            flags.removeAll { $0.id == flag.id } // Immediately update the state
        }
    }
}
