//  Created by Pete Smith
//  http://www.petethedeveloper.com
//
//
//  License
//  Copyright © 2017-present Pete Smith
//  Released under an MIT license: http://opensource.org/licenses/MIT
//


/// Swift Evolution Proposal Model
public struct Proposal {
    let title: String
    let status: Status
    let authors: [Author]
}

public extension Proposal {
    
    private struct InternalConstants {
        static let titleKey = "title"
        static let statusKey = "status"
        static let statusStateKey = "state"
        static let authorsKey = "authors"
        static let authorNameKey = "name"
        static let authorLinkKey = "link"
    }
    
    init(withJson json: [String:Any]) {
        let title: String = json[InternalConstants.titleKey] as? String ?? "Title unknown"
        
        var status = Status.unknown
        if let statusJson = json[InternalConstants.statusKey] as? [String:Any],
            let statusValue = statusJson[InternalConstants.statusStateKey] as? String {
            
            status = Status(withRawValue: statusValue)
        }
        
        var authors: [Author] = []
        if let authorsData = json[InternalConstants.authorsKey] as? [[String:String]] {
            for author in authorsData {
                
                let authorName = author[InternalConstants.authorNameKey] ?? "Author unknown"
                let authorLink: String? = author[InternalConstants.authorLinkKey] ?? nil
                
                authors.append(Author(name: authorName, link: authorLink))
            }
        }
        
        self = Proposal(title: title, status: status, authors: authors)
    }
}
