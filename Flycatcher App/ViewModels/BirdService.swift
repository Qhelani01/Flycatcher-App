//
//  BirdService.swift
//  Flycatcher App
//
//  Created by Qhelani Moyo on 7/1/25.
//

import Foundation

class BirdService {
    static let shared = BirdService()

    private init() {}

    func fetchObservations(completion: @escaping (Result<[Observation], Error>) -> Void) {
        let urlString = "https://api.ebird.org/v2/data/obs/ZA/recent"
        guard let url = URL(string: urlString) else { return }

        var request = URLRequest(url: url)
        request.setValue(Config.ebirdApiKey, forHTTPHeaderField: "X-eBirdApiToken")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let data = data else { return }

            do {
                let observations = try JSONDecoder().decode([Observation].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(observations))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    
        print("API Key: \(Config.ebirdApiKey)")
    }
}
