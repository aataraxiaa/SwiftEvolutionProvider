//
//  TableViewController.swift
//  SwiftEvolutionProvider
//
//  Created by Pete Smith on 05/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import SwiftEvolutionProvider

class TableViewController: UITableViewController {
    
    fileprivate lazy var proposals: [Proposal] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        ProposalProvider.proposals(withSuccess: { proposals in
            self.proposals.append(contentsOf: proposals)
            self.tableView.reloadData()
        }, andFailure: { error in
            // Do nothing
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return proposals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let proposal = proposals[indexPath.row]
        cell.textLabel?.text = proposal.title

        return cell
    }

}
