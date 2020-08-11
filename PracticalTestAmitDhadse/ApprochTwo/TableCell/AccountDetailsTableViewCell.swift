//
//  AccountDetailsTableViewCell.swift
//  PracticalTestAmitDhadse
//
//  Created by Amit Dhadse on 11/08/20.
//  Copyright © 2020 Amit Dhadse. All rights reserved.
//

import UIKit

class AccountDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var iBrandImageView: UIImageView!
    @IBOutlet weak var iRefreshViewContainer: UIView!
    @IBOutlet weak var iBrandName: UILabel!
    @IBOutlet weak var iTimeLabel: UILabel!
    @IBOutlet weak var iMoneyLabel: UILabel!
    @IBOutlet weak var iAvailableBalanceLabel: UILabel!
    @IBOutlet weak var iBillsDotView: UIView!
    @IBOutlet weak var iCashDotView: UIView!
    @IBOutlet weak var iSpentProgressView: UIProgressView!
    @IBOutlet weak var iIncomeProgressView: UIProgressView!
    @IBOutlet weak var iSpentAmountLabel: UILabel!
    @IBOutlet weak var iIncomeAmountLabel: UILabel!
    @IBOutlet weak var iProgressViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var iBrandImageWidthConstraints: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iAvailableBalanceLabel.text = "Available balance"
        iSpentProgressView.layer.cornerRadius = 5
        iIncomeProgressView.layer.cornerRadius = 5
        iBillsDotView.layer.cornerRadius = iBillsDotView.frame.width / 2
        iCashDotView.layer.cornerRadius = iCashDotView.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    func RefreshUI(aType: AccountType, aDetails: Details) {
        let spentValue = Float(aDetails.spentAmount?.replacingOccurrences(of: "$", with: "") ?? "0")!
        iSpentProgressView.progress = spentValue
        let incomeValue = Float(aDetails.incomeAmount?.replacingOccurrences(of: "$", with: "") ?? "0")!
        iIncomeProgressView.progress = incomeValue
        iProgressViewWidthConstraint.constant = iIncomeProgressView.bounds.width * CGFloat(spentValue / incomeValue)

        iBrandName.text = aDetails.title
        iMoneyLabel.text = aDetails.balance
        iSpentAmountLabel.text = aDetails.spentAmount
        iIncomeAmountLabel.text = aDetails.incomeAmount
        if aDetails.time == "" {
            iRefreshViewContainer.isHidden = true
        } else {
            iRefreshViewContainer.isHidden = false
        }
        iTimeLabel.text = aDetails.time

        switch aType {
        case .allAccount:
            iBrandImageWidthConstraints.constant = 0
            iBrandImageView?.isHidden = true
            iBrandName.textColor = UIColor.white
            iMoneyLabel.textColor = UIColor.white
            iSpentAmountLabel.textColor = UIColor.white
            iIncomeAmountLabel.textColor = UIColor.white
            iTimeLabel.textColor = UIColor.white
            iAvailableBalanceLabel.textColor = UIColor.white
        case .westpac:
            iBrandImageWidthConstraints.constant = 20
            iBrandImageView?.isHidden = false
            iBrandImageView?.image = UIImage(named: "BrandOne")
            iBrandName.textColor = UIColor.black
            iMoneyLabel.textColor = UIColor.black
            iSpentAmountLabel.textColor = UIColor.black
            iIncomeAmountLabel.textColor = UIColor.black
            iTimeLabel.textColor = UIColor.black
            iAvailableBalanceLabel.textColor = UIColor.black
        default:
            print("default")
        }
    }
}
