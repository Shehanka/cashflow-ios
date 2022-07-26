//
//  TabBarController.swift
//  Cashflow
//
//  Created by Chamod Shehanka Perera on 2022-07-27.
//

import UIKit

class TabBarController: UITabBarController {

    var selectedPassedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpUI()
    }
    
    func setUpUI()
    {
     
        // set navigation bar image
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(named: "Loan.png")!.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0 ,right: 0), resizingMode: .stretch), for: .default)
        self.navigationController?.isNavigationBarHidden = false

        // background color
//        self.view.backgroundColor = UIColor.backgroundColor()

        // set tab bar items programatically
        let mortgageItem = UITabBarItem(title: NSLocalizedString("mortgage", comment: ""), image: UIImage(named: "Mortgage.png"), selectedImage: UIImage(named: "Mortgage.png"))
        let savingsItem = UITabBarItem(title: NSLocalizedString("savings", comment: ""),image: UIImage(named: "Saving.png"), selectedImage: UIImage(named: "Saving.png"))
        let loanItem = UITabBarItem(title: NSLocalizedString("loan", comment: ""),image: UIImage(named: "Loan.png"), selectedImage: UIImage(named: "Loan.png"))
        
        // view controllers are embedded in a parent which has a scrollview - ScrollViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let updateSavingsVC = storyboard.instantiateViewController(withIdentifier: "scrollVC")
        let updateMortgageVC = storyboard.instantiateViewController(withIdentifier: "scrollVC")
        let updateLoanVC = storyboard.instantiateViewController(withIdentifier: "scrollVC")
    
        updateMortgageVC.tabBarItem = mortgageItem
        updateSavingsVC.tabBarItem = savingsItem
        updateLoanVC.tabBarItem = loanItem
        
        // pass the index to ScrollViewController in order to load the child controller view, in container
//        (updateSavingsVC as! ScrollViewController).selectedTabIndex = 0
//        (updateMortgageVC as! ScrollViewController).selectedTabIndex = 1
//        (updateLoanVC as! ScrollViewController).selectedTabIndex = 2

        // programatically setting view controllers in tab bar
        let tabControllers = [updateSavingsVC,updateMortgageVC,updateLoanVC]
        self.viewControllers = tabControllers
        self.selectedIndex = selectedPassedIndex
    }
}
