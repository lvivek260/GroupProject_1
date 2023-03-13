//
//  WatchViewController.swift
//  MultipleApiFetch
//
//  Created by Admin on 11/03/23.
//

import UIKit
import SDWebImage

class WatchViewController: UIViewController {
    
    @IBOutlet weak var watchSegment: UISegmentedControl!
    @IBOutlet weak var watchTableView: UITableView!
    
    var menWatch:[Datum] = []
    var womenWatch:[Datum] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        watchTableView.delegate = self
        watchTableView.dataSource = self
         fetchWatchData()
    }
  
    private func fetchWatchData(){
        guard let fileLocation = Bundle.main.url(forResource: "watchJsonFile", withExtension: "json")
        else{return}
        do{
            let data = try Data( contentsOf: fileLocation)
            let recivedData = try JSONDecoder().decode([WatchModelElement].self, from: data)
            self.menWatch=recivedData[0].data
            self.womenWatch=recivedData[1].data
            
            DispatchQueue.main.async {
                self.watchTableView.reloadData()
            }
        }
        catch{
            print("Data Not Fetched")
        }
    }
    
    @IBAction func watchSegmentAction(_ sender: UISegmentedControl) {
        watchTableView.reloadData()
    }
}

extension WatchViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var totalCell = 0
        if(watchSegment.selectedSegmentIndex == 0){
            totalCell = menWatch.count
        }
        else{
            totalCell = womenWatch.count
        }
        return totalCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = watchTableView.dequeueReusableCell(withIdentifier: "watchTableCell", for: indexPath) as! WatchTableViewCell
        if(watchSegment.selectedSegmentIndex == 0){
            let eachObj = menWatch[indexPath.row]
            let url = URL(string: eachObj.thumbnail)
            cell.watchImage.sd_setImage(with: url)
            cell.watchTitle.text = eachObj.title
            cell.watchPrice.text = "Price \(eachObj.price)"
        }
        else{
            let eachObj = womenWatch[indexPath.row]
            let url = URL(string: eachObj.thumbnail)
            cell.watchImage.sd_setImage(with: url)
            cell.watchTitle.text = eachObj.title
            cell.watchPrice.text = "Price \(eachObj.price)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let watchDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "WatchDetailViewController") as! WatchDetailViewController
        if(watchSegment.selectedSegmentIndex == 0){
            watchDetailViewController.data = menWatch[indexPath.row]
        }
        else{
            watchDetailViewController.data = womenWatch[indexPath.row]
        }
        self.navigationController?.pushViewController(watchDetailViewController, animated: true)
    }
}
