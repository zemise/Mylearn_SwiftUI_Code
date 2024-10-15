@testable import MyLibrary
@testable import MyLibrary2
import XCTest

final class MyLibraryTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods

        XCTAssertEqual(MyLibrary().text, "Hello, World")
        MyLibrary().printText()
        print(Person(name: "zemise").name)

        MyLibrary2().printText()
    }
}
