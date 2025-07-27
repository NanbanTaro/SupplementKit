// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct SupplementKit {

    public init() { }
    
    /// サプリメント一覧を取得する
    /// - Returns: サプリメント一覧
    public func getSupplements() throws -> [Supplement] {
        guard let path = Bundle.module.path(forResource: "Supplements", ofType: "json"),
              let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            throw SupplementKitError.fileNotFound
        }

        let supplements = try loadSupplements(from: jsonData)
        return supplements
    }
    
    /// サプリメント情報を読み込む
    /// - Parameter jsonData: Jsonデータ
    /// - Returns: サプリメント一覧
    private func loadSupplements(from jsonData: Data) throws -> [Supplement] {
        do {
            let decoder = JSONDecoder()
            let supplements = try decoder.decode(SupplementList.self, from: jsonData)
            return supplements.supplements
        } catch {
            throw SupplementKitError.decodingFailed
        }
    }
}
