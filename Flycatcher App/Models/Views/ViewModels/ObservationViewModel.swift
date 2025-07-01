//
//  ObservationViewModel.swift
//  Flycatcher App
//
//  Created by Qhelani Moyo on 7/1/25.
//

import Foundation

class ObservationViewModel: ObservableObject {
    @Published var observations: [Observation] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchObservations() {
        isLoading = true
        BirdService.shared.fetchObservations { result in
            self.isLoading = false
            switch result {
            case .success(let observations):
                self.observations = observations
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
