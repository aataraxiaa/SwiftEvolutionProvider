//  Created by Pete Smith
//  http://www.petethedeveloper.com
//
//
//  License
//  Copyright © 2017-present Pete Smith
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

public struct ProposalProvider {
    
    public static func proposals(withSuccess success: @escaping (([Proposal]) -> Void),
                                 andFailure failure: @escaping ((ProposalError) -> Void)) -> URLSessionDataTask? {
        
        let url = "https://data.swift.org/swift-evolution/proposals"
        
        return APIClient.get(from: url, withSuccess: { results in
            
            guard let proposalData = results as? [[String:Any]] else {
    
                failure(ProposalError.noProposals)
                return
            }
            
            let proposals = proposalData.map {
                Proposal(withJson: $0)
            }
            
            success(proposals)
            
        }, andFailure: { error in
            failure(ProposalError.generic)
        } )
    }
}
