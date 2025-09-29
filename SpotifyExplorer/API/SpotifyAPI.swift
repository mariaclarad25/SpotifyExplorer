//
//  SpotifyAPI.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 15/08/25.
//

import Foundation

final class SpotifyAPI {
    static let shared = SpotifyAPI()
    private init() {}
    
    private func makeRequest(url: URL, token: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    func performRequest(url: URL) async throws -> Data {
        let token = try await SpotifyTokenManager.shared.getValidToken()
        let request = makeRequest(url: url, token: token)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let http = response as? HTTPURLResponse else {
            throw SpotifyError.invalidResponse
        }
        
        return try handleResponseStatus(http.statusCode, data: data)
    }
    
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(type, from: data)
    }
    
    func handleResponseStatus(_ statusCode: Int, data: Data) throws -> Data {
        switch statusCode {
        case 200...299:
            return data
        case 401:
            throw SpotifyError.unauthorized
        case 429:
            throw SpotifyError.rateLimited
        case 500...599:
            throw SpotifyError.serverError(statusCode)
        default:
            let body = String(data: data, encoding: .utf8) ?? "<no-body>"
            print("[SpotifyAPI] Status não tratado=\(statusCode) body=\(body)")
            throw SpotifyError.invalidResponse
        }
    }
}


