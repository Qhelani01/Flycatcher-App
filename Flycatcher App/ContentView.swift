//
//  ContentView.swift
//  Flycatcher App
//
//  Created by Qhelani Moyo on 7/1/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ObservationViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.observations) { observation in
                VStack(alignment: .leading) {
                    Text(observation.comName)
                        .font(.headline)
                    Text(observation.locName)
                        .font(.subheadline)
                    Text("Observed on \(observation.obsDt)")
                        .font(.caption)
                }
            }
            .navigationTitle("Bird Observations")
            .onAppear {
                viewModel.fetchObservations()
            }
        }
    }
}
