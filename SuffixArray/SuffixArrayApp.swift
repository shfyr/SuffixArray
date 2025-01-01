//
//  SuffixArrayApp.swift
//  SuffixArray
//
//  Created by Elizaveta on 19.12.2024.
//

import SwiftUI

@main
struct SuffixArrayApp: App {
    @State private var path: [Destinations] = []

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                TextFieldScreen(path: $path)
                    .navigationDestination(for: Destinations.self) { destination in
                        switch destination {
                        case let .result(resultDestination):
                            ResultScreen(presenter: ResultScreenPresenter(text: resultDestination.word))
                        }
                    }
            }
        }
    }
}
