// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct SupplementKit {

    public init() { }

    public func get() -> [Supplement] {
        if let path = Bundle.main.path(forResource: "supplements", ofType: "json"),
           let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            if let supplements = loadSupplements(from: jsonData) {
                return supplements
            }
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
    let basicInfo: BasicInfo
    let benefitsAndUsage: BenefitsAndUsage
    let warningsAndSideEffects: WarningsAndSideEffects

    enum CodingKeys: String, CodingKey {
        case basicInfo = "basic_info"
        case benefitsAndUsage = "benefits_and_usage"
        case warningsAndSideEffects = "warnings_and_side_effects"
    }
}

public struct BasicInfo: Codable {
    let name: String
    let brand: String
    let type: String
    let form: String
}

public struct BenefitsAndUsage: Codable {
    let benefits: [String]
    let targetAudience: [String]

    enum CodingKeys: String, CodingKey {
        case benefits
        case targetAudience = "target_audience"
    }
}

public struct WarningsAndSideEffects: Codable {
    let sideEffects: [String]
    let precautions: [String]
    let allergens: [String]

    enum CodingKeys: String, CodingKey {
        case sideEffects = "side_effects"
        case precautions
        case allergens
    }
}
