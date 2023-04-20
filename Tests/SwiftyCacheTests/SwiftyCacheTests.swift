import XCTest
@testable import SwiftyCache

final class SwiftyCacheTests: XCTestCase {
    
    var cache: SwiftyCache<Int, Int>!
    
    override func setUpWithError() throws {
        self.cache = SwiftyCache()
    }
    
    override func tearDownWithError() throws {
        self.cache = nil
    }
    
    func testSetAndGet() {
        cache.set(0, for: 0)
        XCTAssertEqual(cache.get(0), 0)
        
        cache[1] = 1
        XCTAssertEqual(cache[1], 1)
    }
    
    func testDelete() {
        cache.set(2, for: 2)
        cache.delete(2)
        XCTAssertNil(cache.get(2))
        
        cache[3] = 3
        cache[3] = nil
        XCTAssertNil(cache[3])
    }
    
    func testDeleteAll() {
        cache.set(1, for: 1)
        cache.set(2, for: 2)
        cache.set(3, for: 3)
        cache.deleteAll()
        
        XCTAssertEqual(cache.get(), [])
    }
}
