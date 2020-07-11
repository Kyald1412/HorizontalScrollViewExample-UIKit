//
//  AcademyTableCell.swift
//  HorizontalScrollView
//
//  Created by Dhiky Aldwiansyah on 11/07/20.
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import UIKit

class AcademyTableCell: UITableViewCell{

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var lblTest: UILabel!
    
    var academyData: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 100)
        flowLayout.minimumLineSpacing = 20.0
        flowLayout.minimumInteritemSpacing = 20.0
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        // Register the xib for collection view cell
        let cellNib = UINib(nibName: "AcademyCollectionCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "AcademyCollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
}

extension AcademyTableCell : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setDataSource(data: [String]){
        self.academyData = data
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.academyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AcademyCollectionCell", for: indexPath) as? AcademyCollectionCell {

            cell.set(forData: self.academyData[indexPath.row])

            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
