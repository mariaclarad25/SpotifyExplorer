//
//  ErrorHandling.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 14/08/25.
//

import Foundation

enum SpotifyError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case unauthorized
    case rateLimited
    case serverError(Int)
    case networkError(Error)
    
    case authenticationFailed(reason: AuthenticationFailureReason)
    
    enum AuthenticationFailureReason {
        case networkError(underlyingError: Error)
        case badRequest(statusCode: Int, message: String)
        case invalidResponse
        case decodingError(underlyingError: Error)
    }
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "A URL da requisição é inválida."
        case .unauthorized:
            return "Não autorizado. O token pode ter expirado ou ser inválido."
        case .authenticationFailed(let reason):
            return "Falha na autenticação: \(reason.localizedDescription)"
        case .networkError(let error):
            return "Erro de rede: \(error.localizedDescription)"
        default:
            return "Ocorreu um erro inesperado."
        }
    }
}

extension SpotifyError.AuthenticationFailureReason {
    var localizedDescription: String {
        switch self {
        case .networkError(let error):
            return "Não foi possível conectar ao Spotify. Verifique sua internet. (\(error.localizedDescription))"
        case .badRequest(let statusCode, let message):
            return "Requisição inválida (Status: \(statusCode)). O Spotify retornou: \(message)"
        case .invalidResponse:
            return "A resposta do servidor de autenticação foi malformada."
        case .decodingError:
            return "Não foi possível 'ler' a resposta do token do Spotify."
        }
    }
}
