//  Created by Pete Smith
//  http://www.petethedeveloper.com
//
//
//  License
//  Copyright © 2017-present Pete Smith
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

public enum Status: String {
    case accepted
    case activeReview
    case implemented
    case deferred
    case rejected
    case withdrawn
    case unknown
}

public extension Status {
    
    init(withRawValue rawValue: String) {
        self = Status(rawValue: rawValue) ?? .unknown
    }
}
