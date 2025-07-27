import Testing
@testable import SupplementKit

struct SupplementKitTests {

    let supplementKit = SupplementKit()

    @Test func example() async throws {
        let supplements = try supplementKit.getSupplements()
        #expect(supplements[0].basicInfo.name == "ビタミンC 1000mg")
    }
}
