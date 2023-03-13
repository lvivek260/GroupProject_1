//
//  CartsViewController.swift
//  MultipleApiFetch
//
//  Created by Admin on 12/03/23.
//

import UIKit

class CartsViewController: UIViewController {
    @IBOutlet weak var cartsTableView: UITableView!
    var carts = [Cart]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartsTableView.delegate = self
        cartsTableView.dataSource = self
        let nib = UINib(nibName: "CartsTableViewCell", bundle: nil)
        cartsTableView.register(nib, forCellReuseIdentifier: "CartsTableViewCell")
        cartsDataFetch()
    }
    
    private func cartsDataFetch(){
        let url = URL(string: "https://dummyjson.com/carts")
        let request = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with: request){
            data,response,error in
            print(data as Any)
            if(error == nil){
                do{
                    let cartsData = try JSONDecoder().decode(CartsModel.self, from: data!)
                    self.carts = cartsData.carts
                    DispatchQueue.main.async {
                        self.cartsTableView.reloadData()
                    }
                }
                catch{
                    print("Data Not Fetched")
                }
            }
            else{}
        }
        dataTask.resume()

    }
}

extension CartsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return carts.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width), height: 30))
        
        let titleHeader = UILabel(frame: CGRect(x: 16, y: 0, width: self.view.frame.width-50, height: 30))
        titleHeader.text = "ID " + String(carts[section].id)
        titleHeader.textColor = .white
        titleHeader.textAlignment = .left
        titleHeader.font = .preferredFont(forTextStyle: .title2)
        headerView.backgroundColor = .black
        headerView.addSubview(titleHeader)
        
        let headerRightSymbol = UILabel(frame: CGRect(x: Int(self.view.frame.width)-50, y: 0, width: 50-16, height: 30))
        headerRightSymbol.text = "-->"
        headerRightSymbol.textColor = .white
        headerRightSymbol.font = .preferredFont(forTextStyle: .title2)
        headerView.addSubview(headerRightSymbol)
        
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartsTableView.dequeueReusableCell(withIdentifier: "CartsTableViewCell", for: indexPath) as! CartsTableViewCell
        cell.products = carts[indexPath.section].products
        cell.cartVC = self
        return cell
    }
}

extension CartsViewController:UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
}
