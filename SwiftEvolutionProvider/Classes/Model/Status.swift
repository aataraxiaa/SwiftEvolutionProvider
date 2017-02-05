//  Created by Pete Smith
//  http://www.petethedeveloper.com
//
//
//  License
//  Copyright © 2017-present Pete Smith
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

public struct Status {
    let version: String?
    let state: State
}

public extension Status {
    
    private struct InternalConstants {
        static let versionKey = "version"
        static let stateKey = "state"
    }
    
    init(withJson json: [String:String]) {
        
        version = json[InternalConstants.versionKey] ?? nil
        
        var stateValue = json[InternalConstants.stateKey] ?? "unknown"
        if stateValue.hasPrefix(".") {
            stateValue = stateValue.substring(
                from: stateValue.index(after: stateValue.startIndex))
        }
    
        state = State(withRawValue: stateValue)
    }
}

public enum State: String {
    case accepted
    case activeReview
    case implemented
    case deferred
    case rejected
    case withdrawn
    case unknown
}

public extension State {
    
    init(withRawValue rawValue: String) {
        self = State(rawValue: rawValue) ?? .unknown
    }
}
