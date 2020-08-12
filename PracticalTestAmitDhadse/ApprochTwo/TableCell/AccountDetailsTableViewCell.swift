//
//  AccountDetailsTableViewCell.swift
//  PracticalTestAmitDhadse
//
//  Created by Amit Dhadse on 11/08/20.
//  Copyright © 2020 Amit Dhadse. All rights reserved.
//

import UIKit

class AccountDetailsTableViewCell: UITableViewCell {
    @IBOutlet var iBrandImageView: UIImageView!
    @IBOutlet var iRefreshViewContainer: UIView!
    @IBOutlet var iBrandName: UILabel!
    @IBOutlet var iTimeLabel: UILabel!
    @IBOutlet var iMoneyLabel: UILabel!
    @IBOutlet var iAvailableBalanceLabel: UILabel!
    @IBOutlet var iBillsDotView: UIView!
    @IBOutlet var iCashDotView: UIView!
    @IBOutlet var iSpentProgressView: UIProgressView!
    @IBOutlet var iIncomeProgressView: UIProgressView!
    @IBOutlet var iSpentAmountLabel: UILabel!
    @IBOutlet var iIncomeAmountLabel: UILabel!
    @IBOutlet var iProgressViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet var iBrandImageWidthConstraints: NSLayoutConstraint!
    @IBOutlet var iBrandImageViewLeadingContrants: NSLayoutConstraint!
    @IBOutlet var iIncomeProgressViewLeadingConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iAvailableBalanceLabel.text = "Available balance"
        iSpentProgressView.layer.cornerRadius = 5
        iIncomeProgressView.layer.cornerRadius = 5
        iBillsDotView.layer.cornerRadius = iBillsDotView.frame.width / 2
        iCashDotView.layer.cornerRadius = iCashDotView.frame.width / 2
        iBrandImageView.setShadowBorder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func RefreshUI(aType: AccountType, aDetails: Details) {
        let spentValue = Float(aDetails.spentAmount?.replacingOccurrences(of: "$", with: "") ?? "0")!

        if spentValue == 0 {
            iIncomeProgressViewLeadingConstraint.constant = 0
        } else {
            iIncomeProgressViewLeadingConstraint.constant = 20
        }

        UIView.animate(withDuration: 1.5) {
            self.iSpentProgressView.setProgress(spentValue, animated: true)
        }

        let incomeValue = Float(aDetails.incomeAmount?.replacingOccurrences(of: "$", with: "") ?? "0")!
        UIView.animate(withDuration: 1.5) {
            self.iIncomeProgressView.setProgress(incomeValue, animated: true)
        }

        iProgressViewWidthConstraint.constant = iIncomeProgressView.bounds.width * CGFloat(spentValue / incomeValue)

        iBrandName.text = aDetails.title
        iMoneyLabel.text = aDetails.balance
        iSpentAmountLabel.attributedText = Utils.sharedInstance.getAttributtedText(aTextOne: aDetails.spentAmount ?? "", aTextTwo: " Spent", aColor: .white)
        iIncomeAmountLabel.attributedText = Utils.sharedInstance.getAttributtedText(aTextOne: aDetails.incomeAmount ?? "", aTextTwo: " Income", aColor: .white)
        if aDetails.time == "" {
            iRefreshViewContainer.isHidden = true
        } else {
            iRefreshViewContainer.isHidden = false
        }
        iTimeLabel.text = aDetails.time

        switch aType {
        case .allAccount:
            iBrandImageWidthConstraints.constant = 0
            iBrandImageViewLeadingContrants.constant = 0
            iBrandImageView?.isHidden = true
            iBrandName.textColor = UIColor.white
            iMoneyLabel.textColor = UIColor.white
            iSpentAmountLabel.textColor = UIColor.white
            iIncomeAmountLabel.textColor = UIColor.white
            iTimeLabel.textColor = UIColor.white
            iAvailableBalanceLabel.textColor = UIColor.white
        case .westpac:
            iBrandImageWidthConstraints.constant = 20
            iBrandImageViewLeadingContrants.constant = 8
            iBrandImageView?.isHidden = false
            iBrandImageView?.image = UIImage(named: "BrandOne")
            iBrandName.textColor = UIColor.black
            iMoneyLabel.textColor = UIColor.black
            iSpentAmountLabel.textColor = UIColor.black
            iIncomeAmountLabel.textColor = UIColor.black
            iTimeLabel.textColor = UIColor.lightGray
            iAvailableBalanceLabel.textColor = UIColor.black
        default:
            print("")
        }
    }
}
