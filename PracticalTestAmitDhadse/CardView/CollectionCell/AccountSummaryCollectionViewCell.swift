//
//  AccountSummaryCollectionViewCell.swift
//  PracticalTestAmitDhadse
//
//  Created by Amit Dhadse on 10/08/20.
//  Copyright © 2020 Amit Dhadse. All rights reserved.
//

import UIKit

protocol AccountSummaryCollectionViewCellDelegate {
    func expandAccountSummaryCard(expand: Bool)
}

class AccountSummaryCollectionViewCell: UICollectionViewCell {
    @IBOutlet var iTableView: UITableView!
    var iflag = false

    var iDeleagate: AccountSummaryCollectionViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iTableView.isScrollEnabled = false
        iTableView.register(UINib(nibName: "AccountTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountCellIdentifier")
    }
}

// MARK: - TableView DataSouces

extension AccountSummaryCollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if iflag {
            return 3
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCellIdentifier", for: indexPath) as? AccountTableViewCell else { fatalError("Unable to create cell") }

        cell.selectionStyle = .none
        cell.backgroundColor = .red

        return cell
    }
}

// MARK: - TableView DataSouces

extension AccountSummaryCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 204
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        iflag = true
        iTableView.reloadData()
        iDeleagate?.expandAccountSummaryCard(expand: true)
    }
}
