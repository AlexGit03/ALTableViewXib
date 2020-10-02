import XCTest
import class Foundation.Bundle
import ALTableViewXib

final class ALTableViewXibTests: XCTestCase {
    
    func testExample() throws {
        
        let table = TableViewXib.init()
        print(table)
        
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
