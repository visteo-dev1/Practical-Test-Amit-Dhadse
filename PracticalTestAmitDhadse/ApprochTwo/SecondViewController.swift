//
//  SecondViewController.swift
//  PracticalTestAmitDhadse
//
//  Created by Amit Dhadse on 11/08/20.
//  Copyright © 2020 Amit Dhadse. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var iGradientView: UIView!
    @IBOutlet var iCloseButton: UIButton!
    @IBOutlet var iLabel: UILabel!
    @IBOutlet var iCardTypeLabel: UILabel!
    @IBOutlet var iBackgroundImageView: UIImageView!
    @IBOutlet var iMonthView: UIView!
    @IBOutlet var iTableView: UITableView!
    @IBOutlet var iTabBar: TabBarView!
    var iDetails: [Details]?
    var iCardType: AccountType?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: SetUpView

    func setupView() {
        iGradientView.layer.cornerRadius = 24.0

        iTableView.isScrollEnabled = false
        iTableView.register(UINib(nibName: "AccountDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountDetailsTableViewCellIdentifier")

        iMonthView.layer.cornerRadius = 15
        iTabBar.layer.cornerRadius = 36

        if let cardType = iCardType {
            if cardType == .allAccount {
                iBackgroundImageView.image = #imageLiteral(resourceName: "BlueGradient")
                iCardTypeLabel.text = "All accounts"
            } else {
                iBackgroundImageView.image = #imageLiteral(resourceName: "White")
                iCardTypeLabel.text = "Westpac"
            }
        }
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
}

// MARK: - TableView DataSouces

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iDetails?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccountDetailsTableViewCellIdentifier", for: indexPath) as? AccountDetailsTableViewCell else { fatalError("Unable to create cell") }

        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            cell.iAvailableBalanceLabel.isHidden = false
        } else {
            cell.iAvailableBalanceLabel.isHidden = true
        }

        if let cardDetails = iDetails {
            if let cardType = iCardType {
                cell.RefreshUI(aType: cardType, aDetails: cardDetails[indexPath.row])
            }
        }

        return cell
    }
}

// MARK: - TableView DataSouces

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 204
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
