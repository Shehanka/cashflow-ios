//
//  ViewController.swift
//  Cashflow
//
//  Created by Chamod Shehanka Perera on 2022-07-23.
//

import UIKit

class ViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // variables
    var buttonList = [HomeButton]()
    let cellWidth = 130

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
        self.collectionView.dataSource = self
//        self.collectionView.delegate = self
    }

    func setUpUI() {
        loadHomeButtons()
    }
    
    func loadHomeButtons () {
        buttonList.append(HomeButton(title: NSLocalizedString("Savings", comment: ""), photoName: "Saving.png"))
        buttonList.append(HomeButton(title: NSLocalizedString("Mortgage", comment: ""), photoName: "Mortgage.png"))
        buttonList.append(HomeButton(title: NSLocalizedString("Loan", comment: ""), photoName: "Loan.png"))
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonIdentifier", for: indexPath) as! HomeButtonView
        cell.title.text = buttonList[indexPath.row].title
        cell.image.image = UIImage(named: buttonList[indexPath.row].photoName)!
        
        //simple animation for cells. alpha 0 to 1.
        cell.alpha = 0
        cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 1, delay:1.0, animations: {
                cell.alpha = 1
                cell.transform = .identity
        }, completion: nil)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        if(indexPath.row != 3)
        {
            let tabBarController = storyboard.instantiateViewController(withIdentifier:"tabBarController") as! TabBarController
            // pass the index to identify and change titles accordingly
            tabBarController.selectedPassedIndex = indexPath.row
            navigationController?.pushViewController(tabBarController,animated: true)
        }
        else
        {
            // help view
//            let helpController = storyboard.instantiateViewController(withIdentifier:"helpVC") as! HelpViewController
//            self.present(helpController, animated: true, completion: nil)

        }
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        // programatically identifying and setting the space between cells
        let count = UIDevice.current.orientation.isLandscape ? 4 : 2;
        let deviceWidth = Int(UIScreen.main.bounds.width)
        let boundsWidth = cellWidth * count + 20*(count - 1)
        let diff = CGFloat(deviceWidth - boundsWidth)
        
        return UIEdgeInsets(top: 20, left: diff/2, bottom: 20, right: diff/2)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height:  cellWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
