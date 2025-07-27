import Foundation

public enum SupplementKitError: Error {
    case fileNotFound
    case decodingFailed
}

extension SupplementKitError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "File not found."
        case .decodingFailed:
            return "Decoding failed."
        }
    }
}
