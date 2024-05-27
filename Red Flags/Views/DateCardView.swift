//
//  DateCardView.swift
//  Red Flags
//
//  Created by Mohameth Seck on 5/26/24.
//
import SwiftUI

// Helper function to determine the emoji based on green and red flag counts
func determineEmoji(greenFlags: Int, redFlags: Int) -> String {
    if redFlags > greenFlags {
        switch redFlags {
        case 1:
            return "🙁"
        case 2:
            return "😒"
        case 3:
            return "🙄"
        case 4:
            return "😡"
        case 5...:
            return "🤮"
        default:
            return "😐"
        }
    } else {
        switch greenFlags {
        case 1:
            return "🙂"
        case 2:
            return "😊"
        case 3:
            return "🤩"
        case 4:
            return "😍"
        case 5...:
            return "🥵"
        default:
            return "🙂"
        }
    }
}

struct DateCardView: View {
    var person: Person

    var body: some View {
        let greenFlagsCount = person.flags?.filter { $0.isGreenFlag }.count ?? 0
        let redFlagsCount = person.flags?.filter { !$0.isGreenFlag }.count ?? 0
        let emoji = determineEmoji(greenFlags: greenFlagsCount, redFlags: redFlagsCount)

        VStack {
            HStack {
                Text(emoji)
                    .font(.system(size: 70))
                   
                VStack(alignment: .leading) {
                    Text(person.name)
                        .font(.headline)
                        .bold()
                    Text("Height: \(person.height, specifier: "%.1f")")
                    Text("Age: \(person.age)")
                       
                    HStack {
                        Group {
                            Text("\(greenFlagsCount)")
                            Image(systemName: "flag.fill")
                                .foregroundColor(.green)
                        }
                        Group {
                            Text("\(redFlagsCount)")
                            Image(systemName: "flag.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
                .frame(width: 150, height: 100)
            }
            .frame(width: 300)
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

//#Preview {
//    DateCardView(person: Person(id: UUID(), name: "Sample Person", age: 25, city: "Sample City", height: 5.9, startDate: Date(), strikes: 0, flags: [Flag(id: UUID(), title: "Punctual", detail: "Always on time", isRedFlag: false), Flag(id: UUID(), title: "Rude", detail: "Speaks rudely", isRedFlag: true)]))
//}
