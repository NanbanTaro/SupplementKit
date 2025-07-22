// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct SupplementKit {

    public init() { }

    public func get() -> [Supplement] {
        guard let path = Bundle.main.path(forResource: "supplements", ofType: "json") else {
            print("path not found")
            return []
        }

        guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            print("jsonData not found")
            return []
        }

        if let supplements = loadSupplements(from: jsonData) {
            return supplements
        }

        return []
    }

    private func loadSupplements(from jsonData: Data) -> [Supplement]? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            let supplements = try decoder.decode([Supplement].self, from: jsonData)
            return supplements
        } catch {
            print("デコードエラー: \(error)")
            return nil
        }
    }

}


public struct Supplement: Codable {
    public let basicInfo: BasicInfo
    public let benefitsAndUsage: BenefitsAndUsage
    public let warningsAndSideEffects: WarningsAndSideEffects

    enum CodingKeys: String, CodingKey {
        case basicInfo = "basic_info"
        case benefitsAndUsage = "benefits_and_usage"
        case warningsAndSideEffects = "warnings_and_side_effects"
    }
}

public struct BasicInfo: Codable {
    public let name: String
    public let brand: String
    public let type: String
    public let form: String
}

public struct BenefitsAndUsage: Codable {
    public let benefits: [String]
    public let targetAudience: [String]

    enum CodingKeys: String, CodingKey {
        case benefits
        case targetAudience = "target_audience"
    }
}

public struct WarningsAndSideEffects: Codable {
    public let sideEffects: [String]
    public let precautions: [String]
    public let allergens: [String]

    enum CodingKeys: String, CodingKey {
        case sideEffects = "side_effects"
        case precautions
        case allergens
    }
}
