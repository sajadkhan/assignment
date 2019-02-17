//
//  GridViewController.swift
//  Assignment
//
//  Created by Muhammad Sajad on 17/02/2019.
//  Copyright © 2019 Muhammad Sajad. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {


    @IBOutlet weak var gridCollectionView: UICollectionView! {
        didSet {
            gridCollectionView.delegate = self
            gridCollectionView.dataSource = self
        }
       
    }
    
    //Model
    var items: [GridItem] = [] {
        didSet {
            //Reload On Main Thread
            DispatchQueue.main.async {
                self.gridCollectionView.reloadData()
            }
        }
    }
    
    private var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = GridModel.items()
    }

    @IBAction func itemCountTextFieldValueChanged(_ sender: UITextField) {
        if let text = sender.text,
            let count = Int(text) {
            items = GridModel.itemsFor(count: count)
        }
    }
    @IBAction func itemCountTextFieldBeginEditing(_ sender: UITextField) {
        activeTextField = sender
    }
}


extension GridViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "girdCell", for: indexPath) as! GridCollectionViewCell
        cell.nameLabel.text = items[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 100.0
        let width = ((collectionView.frame.size.width / 2.0) - 10.0)
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if activeTextField != nil {
            activeTextField!.resignFirstResponder()
            activeTextField = nil
        }
    }
    
}
