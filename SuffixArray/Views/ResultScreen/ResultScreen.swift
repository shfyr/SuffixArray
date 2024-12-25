//
//  SegmentControlView.swift
//  SuffixArray
//
//  Created by Elizaveta on 19.12.2024.
//

import SwiftUI

struct ResultScreen: View {
    @StateObject var presenter: ResultScreenPresenter
    @State private var selectedOption = 0
    
    var body: some View {
        VStack {
            Text("Text: \(presenter.text)")
                .font(.title)
                .padding()
            
            Picker("Options", selection: $selectedOption) {
                Text("Ascending").tag(0)
                Text("Descending").tag(1)
                Text("Top 10").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            List {
                switch selectedOption {
                case 0:
                    ForEach(presenter.allSuffixes.sorted(), id: \.self) { suffix in
                        HStack {
                            Text(suffix)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Text(String(presenter.allSuffixes.frequency[suffix] ?? 1))
                        }
                    }
                case 1:
                    ForEach(presenter.allSuffixes.sorted(by: >), id: \.self) { suffix in
                        HStack {
                            Text(suffix)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Text(String(presenter.allSuffixes.frequency[suffix] ?? 1))
                        }
                    }
                case 2:
                    ForEach(
                        presenter.getTopTen(),
                        id: \.0) { suffix in
                            HStack {
                                Text(suffix.0)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                Text("\(suffix.1)")
                            }
                        }
                default:
                    Text("Invalid option")
                }
                
            }
        }
        .navigationTitle("Result")    }
}

#Preview {
    ResultScreen(presenter: ResultScreenPresenter(text: "A string is a series of characters, such as Swift, that forms a collection. Strings in Swift are Unicode correct and locale insensitive, and are designed to be efficient. The String type bridges with the Objective-C class NSString and offers interoperability with C functions that works with strings. You can create new strings using string literals or string interpolations. A string literal is a series of characters enclosed in quotes."))
}
