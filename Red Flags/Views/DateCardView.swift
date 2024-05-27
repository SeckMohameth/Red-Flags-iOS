//
//  DateCardView.swift
//  Red Flags
//
//  Created by Mohameth Seck on 5/26/24.
//

import SwiftUI

struct DateCardView: View {
    var body: some View {
        VStack {
            HStack {
                Text("😍")
                    .font(.system(size: 70))
                    //.frame(width: 100, height: 100)
                VStack(alignment: .leading) {
                    Text("Name here")
                        .font(.headline)
                        .bold()
                    Text("Height: 5'11")
                    Text("Age: 25")
                       
                
                    HStack {
                        Group {
                            Text("5")
                            Image(systemName: "flag.fill")
                                .foregroundStyle(.green)
                        }
                        Group {
                            Text("2")
                            Image(systemName: "flag.fill")
                                .foregroundStyle(.red)
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
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    DateCardView()
}
