//
//  WatchDetailViewController.swift
//  MultipleApiFetch
//
//  Created by Admin on 11/03/23.
//

import UIKit

class WatchDetailViewController: UIViewController {
    
    @IBOutlet weak var watchPageControl: UIPageControl!
    @IBOutlet weak var watchDetailCollectionView: UICollectionView!
    @IBOutlet weak var watchTitle: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var data:Datum?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        watchPageControl.currentPage = 0
        watchPageControl.numberOfPages = (data?.images.count) ?? 3
        watchDetailCollectionView.delegate = self
        watchDetailCollectionView.dataSource = self
        let nib = UINib(nibName: "WatchDetailCollectionViewCell", bundle: nil)
        watchDetailCollectionView.register(nib, forCellWithReuseIdentifier: "WatchDetailCollectionViewCell")
        watchTitle.text = data?.title
        price.text = "Rs \(data!.price)"
    }

}

extension WatchDetailViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 1
        }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data!.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = watchDetailCollectionView.dequeueReusableCell(withReuseIdentifier: "WatchDetailCollectionViewCell", for: indexPath) as! WatchDetailCollectionViewCell
        let url  = URL(string: data!.images[indexPath.row])
        cell.watchImage.sd_setImage(with: url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        watchPageControl.currentPage = indexPath.row
    }
}

extension WatchDetailViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width
        return CGSize(width: width, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

