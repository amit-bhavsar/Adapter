import XCTest
@testable import Adapter

final class AdapterTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Adapter().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
