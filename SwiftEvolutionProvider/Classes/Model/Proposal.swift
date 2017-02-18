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
    public let id: String
    public let title: String
    public let status: Status
    public let authors: [Author]
    public let link: String
}

public extension Proposal {
    
    private struct InternalConstants {
        static let idKey = "id"
        static let titleKey = "title"
        static let statusKey = "status"
        static let linkKey = "link"
        static let authorsKey = "authors"
        static let authorNameKey = "name"
    }
    
    init(withJson json: [String:Any]) {
        
        let id = json[InternalConstants.idKey] as? String ?? "Id unknown"
        
        let title = json[InternalConstants.titleKey] as? String ?? "Title unknown"
        
        let link = json[InternalConstants.linkKey] as? String ?? ""
        
        var status = Status(version: nil, state: .unknown)
        if let statusJson = json[InternalConstants.statusKey] as? [String:String] {
            status = Status(withJson: statusJson)
        }
        
        var authors: [Author] = []
        if let authorsData = json[InternalConstants.authorsKey] as? [[String:String]] {
            for author in authorsData {
                
                let authorName = author[InternalConstants.authorNameKey] ?? "Author unknown"
                let authorLink: String? = author[InternalConstants.linkKey] ?? nil
                
                authors.append(Author(name: authorName, link: authorLink))
            }
        }
        
        self = Proposal(id: id, title: title, status: status, authors: authors, link: link)
    }
}
