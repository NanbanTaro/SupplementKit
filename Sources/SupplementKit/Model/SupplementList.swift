/// サプリメント一覧
struct SupplementList: Codable {
    /// サプリメント一覧
    public let supplements: [Supplement]

    enum CodingKeys: String, CodingKey {
        case supplements
    }
}

/// サプリメント
public struct Supplement: Codable {
    /// 基本情報
    public let basicInfo: BasicInfo
    /// 期待される健康効果と主な対象
    public let benefitsAndUsage: BenefitsAndUsage
    /// 副作用や注意点
    public let warningsAndSideEffects: WarningsAndSideEffects

    enum CodingKeys: String, CodingKey {
        case basicInfo = "basic_info"
        case benefitsAndUsage = "benefits_and_usage"
        case warningsAndSideEffects = "warnings_and_side_effects"
    }
}

/// 基本情報
public struct BasicInfo: Codable {
    /// サプリメントの名称
    public let name: String
    /// メーカー名やブランド名
    public let brand: String
    /// サプリの分類
    public let type: String
    /// 形状
    public let form: String
}

/// 期待される健康効果と主な対象
public struct BenefitsAndUsage: Codable {
    /// 期待される健康効果
    public let benefits: [String]
    /// 主な対象
    public let targetAudience: [String]

    enum CodingKeys: String, CodingKey {
        case benefits
        case targetAudience = "target_audience"
    }
}

/// 副作用や注意点
public struct WarningsAndSideEffects: Codable {
    /// 想定される副作用
    public let sideEffects: [String]
    /// 注意点
    public let precautions: [String]
    /// 含まれるアレルゲン
    public let allergens: [String]

    enum CodingKeys: String, CodingKey {
        case sideEffects = "side_effects"
        case precautions
        case allergens
    }
}
