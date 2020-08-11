//
//  AccountCardCellCollectionViewCell.swift
//  PracticalTestAmitDhadse
//
//  Created by Amit Dhadse on 11/08/20.
//  Copyright © 2020 Amit Dhadse. All rights reserved.
//

import UIKit

class AccountCardCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet var iBackGroundView: UIView!
    @IBOutlet var iGradientImageView: UIImageView!
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

    override func awakeFromNib() {
        super.awakeFromNib()
        iAvailableBalanceLabel.text = "Available balance"
        iBackGroundView.layer.cornerRadius = 24.0
        iSpentProgressView.layer.cornerRadius = 5
        iIncomeProgressView.layer.cornerRadius = 5
        iBillsDotView.layer.cornerRadius = iBillsDotView.frame.width / 2
        iCashDotView.layer.cornerRadius = iCashDotView.frame.width / 2
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
            iGradientImageView.image = UIImage(named: "BlueGradient")
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
            iGradientImageView.image = UIImage(named: "White")
            iBrandName.textColor = UIColor.black
            iMoneyLabel.textColor = UIColor.black
            iSpentAmountLabel.textColor = UIColor.black
            iIncomeAmountLabel.textColor = UIColor.black
            iTimeLabel.textColor = UIColor.black
            iAvailableBalanceLabel.textColor = UIColor.black
        case .commbank:
            iBrandImageWidthConstraints.constant = 20
            iBrandImageView?.isHidden = false
            iBrandImageView?.image = UIImage(named: "BrandTwo")
            iGradientImageView.image = UIImage(named: "White")
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
