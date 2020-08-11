//
//  ViewController.swift
//  PracticalTestAmitDhadse
//
//  Created by Amit Dhadse on 10/08/20.
//  Copyright © 2020 Amit Dhadse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var iDurationView: UIView!
    @IBOutlet var iBackView: UIView!
    @IBOutlet var iHomeView: UIView!
    @IBOutlet var iCollectionView: UICollectionView!
    @IBOutlet var iBottomBarView: UIView!
    @IBOutlet var iCollectionViewContainerHeightLayout: NSLayoutConstraint!

    //let flowLayout = UICollectionViewFlowLayout()
    //let screenSize = UIScreen.main.bounds
    //let customCollectionLayout = MMBannerLayout()
    var iflag: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }

    // MARK: SetUpView

    private func setUpView() {
        // Register Collection cell
        iCollectionView.register(UINib(nibName: "AccountSummaryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AccountSummaryCellIdentifier")

                
        
        
//        customCollectionLayout.itemSpace = 10
//        customCollectionLayout.itemSize = self.iCollectionView.frame.insetBy(dx: 30, dy: 100).size
//        iCollectionView.collectionViewLayout = customCollectionLayout
    
        //collapseCollectionLayout()
    }
}

// MARK: - Collectionview DataSource Delegate

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountSummaryCellIdentifier", for: indexPath) as? AccountSummaryCollectionViewCell else {
            fatalError("unable to create cell")
        }

        cell.iDeleagate = self

        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//
//    }
}


// MARK: - Expand & Collapse methods

extension ViewController: AccountSummaryCollectionViewCellDelegate {
    func expandAccountSummaryCard(expand: Bool) {
        iCollectionViewContainerHeightLayout.constant = 612
        UIView.animate(withDuration: 0.7) {
            self.view.layoutIfNeeded()
        }

        //expandCollectionLayout()
    }

//    func collapseCollectionLayout() {
//        iCollectionViewContainerHeightLayout.constant = 204
//        UIView.animate(withDuration: 0.7) {
//            self.view.layoutIfNeeded()
//        }
//        customCollectionLayout.itemSpace = 10
//        customCollectionLayout.itemSize = iCollectionView.frame.insetBy(dx: 20, dy: 0).size
//        iCollectionView.isScrollEnabled = true
//        iBackView.isHidden = true
//        iHomeView.isHidden = false
//        iflag = false
//
//    }

//    func expandCollectionLayout() {
//        customCollectionLayout.itemSpace = 10
//        customCollectionLayout.itemSize = CGSize(width: iCollectionView.frame.width - 20 , height: iCollectionViewContainerHeightLayout.constant)
//        iCollectionView.isScrollEnabled = false
//        iBackView.isHidden = false
//        iHomeView.isHidden = true
//        iflag = true
//    }
}

// MARK: BackButton

extension ViewController {
    @IBAction func backButtonClicked() {
        //collapseCollectionLayout()
    }
}



