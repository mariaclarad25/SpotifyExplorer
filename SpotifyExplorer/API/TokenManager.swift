//
//  TokenManager.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 14/08/25.
//

import Foundation

class SpotifyTokenManager {
    static let shared = SpotifyTokenManager()  
    private init() {}
    
    @Published private(set) var accessToken: String?
    @Published private(set) var isAuthenticated = false
    
    private var expirationDate: Date?
    private var tokenTask: Task<String, Error>?
    
    private let clientID = "db8bea93d67144ccbd5c79f47d58cd66"
    private let clientSecret = "e2fe89dda6354e97b53f36c34bbe285a"
        
    func getValidToken() async throws -> String {
            if let token = accessToken, let expiration = expirationDate, Date() < expiration {
                print("Token ainda válido, reutilizando.")
                return token
            }
            
            if let task = tokenTask {
                return try await task.value
            }
            
            let newTask = Task { () -> String in
                try await authenticate()
                guard let token = accessToken else { throw SpotifyError.unauthorized }
                return token
            }
            
            tokenTask = newTask
            let token = try await newTask.value
            tokenTask = nil
            return token
        }
    
    func authenticate() async throws {
        guard let url = URL(string: "https://accounts.spotify.com/api/token" ) else {
            throw SpotifyError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type" )
        
        let credentials = "\(clientID):\(clientSecret)"
        let credentialsData = credentials.data(using: .utf8)!
        let base64Credentials = credentialsData.base64EncodedString()
        request.setValue("Basic \(base64Credentials)", forHTTPHeaderField: "Authorization")
        
        let body = "grant_type=client_credentials"
        request.httpBody = body.data(using: .utf8 )
        
        let (data, response): (Data, URLResponse)
        
        do {
            (data, response) = try await URLSession.shared.data(for: request)
        } catch {
            throw SpotifyError.authenticationFailed(reason: .networkError(underlyingError: error))
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw SpotifyError.authenticationFailed(reason: .invalidResponse )
        }
        
        guard httpResponse.statusCode == 200 else {
            let errorMessage = String(data: data, encoding: .utf8 ) ?? "Nenhuma mensagem de erro."
            throw SpotifyError.authenticationFailed(reason: .badRequest(statusCode: httpResponse.statusCode, message: errorMessage ))
        }
        
        do {
            let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
            
            await MainActor.run {
                self.accessToken = tokenResponse.access_token
                self.isAuthenticated = true
                self.expirationDate = Date().addingTimeInterval(TimeInterval(tokenResponse.expires_in))
                print("Token obtido/renovado com sucesso.")
            }
        } catch {
            throw SpotifyError.authenticationFailed(reason: .decodingError(underlyingError: error))
        }
    }
    
    private struct TokenResponse: Codable {
        let access_token: String
        let token_type: String
        let expires_in: Int
    }
}
