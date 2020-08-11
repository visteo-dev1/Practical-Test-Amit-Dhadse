//
//  FirstViewController.swift
//  PracticalTestAmitDhadse
//
//  Created by Amit Dhadse on 11/08/20.
//  Copyright © 2020 Amit Dhadse. All rights reserved.
//

import MMBannerLayout
import UIKit

enum AccountType {
    case allAccount
    case westpac
    case commbank
}

class FirstViewController: UIViewController {
    @IBOutlet var iCollectionView: UICollectionView!
    @IBOutlet var iMonthView: UIView!
    @IBOutlet var iMoneySpentView: UIView!
    @IBOutlet var iGroceryView: MoneySpentViewContainerView!
    @IBOutlet var iRestaurantView: MoneySpentViewContainerView!
    @IBOutlet var iHouseHoldView: MoneySpentViewContainerView!
    var selectedCell: AccountCardCellCollectionViewCell?
    var selectedCellImageViewSnapshot: UIView?
    var animator: ViewAnimator?
    var accountDetails: [AccountDetails]?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        // Register Collection cell
        iCollectionView.register(UINib(nibName: "AccountCardCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AccountCellIdentifier")

        if let layout = iCollectionView.collectionViewLayout as? MMBannerLayout {
            layout.itemSpace = 15
            layout.itemSize = iCollectionView.frame.insetBy(dx: 25, dy: 0).size
            layout.minimuAlpha = 1
        }
        
        iMoneySpentView.layer.cornerRadius = 12
        iMonthView.layer.cornerRadius = 15
        iGroceryView.iImageView.image = #imageLiteral(resourceName: "Grocery")
        iRestaurantView.iImageView.image = #imageLiteral(resourceName: "Restaurant")
        iHouseHoldView.iImageView.image = #imageLiteral(resourceName: "HouseHold")
        
        iGroceryView.iSpentOnLabel.text = "Groceries"
        iRestaurantView.iSpentOnLabel.text = "Restaurants"
        iHouseHoldView.iSpentOnLabel.text = "Household"
        
        iGroceryView.iAmountSpentLable.text = "$653"
        iRestaurantView.iAmountSpentLable.text = "$405"
        iHouseHoldView.iAmountSpentLable.text = "$201"
        
        
        
        parseData()
    }

    func parseData() {
        if let path = Bundle.main.path(forResource: "AccountDate", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(BankDetails.self, from: data)
                if let data = responseData.data {
                    accountDetails = data
                    iCollectionView.reloadData()
                }
            } catch {
            }
        }
    }

    // func presentSecondViewController(with data: CellData) {
    func presentSecondViewController(aIndexPth: IndexPath) {
        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController

        secondViewController.transitioningDelegate = self
        
        switch aIndexPth.row {
        case 0:
            secondViewController.iDetails = accountDetails?[aIndexPth.row].allAccount
            secondViewController.iCardType = .allAccount
        case 1:
            secondViewController.iDetails = accountDetails?[aIndexPth.row].westpac
            secondViewController.iCardType = .westpac
        default:
            secondViewController.iDetails = accountDetails?[aIndexPth.row].westpac
        }
        secondViewController.modalPresentationStyle = .fullScreen
        present(secondViewController, animated: true)
    }
}

// MARK: - Collectionview DataSource Delegate

extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountCellIdentifier", for: indexPath) as? AccountCardCellCollectionViewCell else {
            fatalError("unable to create cell")
        }
        
        switch indexPath.row {
        case 0:
            cell.RefreshUI(aType: .allAccount, aDetails: (self.accountDetails?[indexPath.row].allAccount?.first)!)
        case 1:
            cell.RefreshUI(aType: .westpac, aDetails: (self.accountDetails?[indexPath.row].westpac?.first)!)
        case 2:
            cell.RefreshUI(aType: .commbank, aDetails: (self.accountDetails?[indexPath.row].commbank?.first)!)
        default:
            print("default")
        }
        

        return cell
    }
}

// MARK: - Collectionview Delegate Methods

extension FirstViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCell = collectionView.cellForItem(at: indexPath) as? AccountCardCellCollectionViewCell

        selectedCellImageViewSnapshot = selectedCell?.iBackGroundView.snapshotView(afterScreenUpdates: false)

        if indexPath.row != 2 {
            presentSecondViewController(aIndexPth: indexPath)
        }
    }
}

// MARK: - ViewControllerTransitioning Delegate method

extension FirstViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let firstViewController = presenting as? FirstViewController,
            let secondViewController = presented as? SecondViewController,
            let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        else { return nil }

        animator = ViewAnimator(type: .present, firstViewController: firstViewController, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let secondViewController = dismissed as? SecondViewController,
            let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        else { return nil }

        animator = ViewAnimator(type: .dismiss, firstViewController: self, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
}
