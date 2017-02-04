import XCTest
import SwiftEvolutionProvider

class Test: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetProposals() {
        
//        let expectation = expectation(description: "Fetch proposals")
        
        _ = ProposalProvider.proposals(withSuccess: { proposals in
            
            XCTAssert(!proposals.isEmpty)
            
//            XCTWaiter.wait(for: expectation, timeout: 5)
        }, andFailure: { _ in })
    }
}
