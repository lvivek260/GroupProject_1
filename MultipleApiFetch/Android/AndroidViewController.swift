import UIKit
import SDWebImage

class AndroidViewController: UIViewController {
    @IBOutlet weak var usersCollectionView: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    var users = [AndroidUser]()
    var searchUsers = [AndroidUser]()
       var urlString : String?
       var url : URL?
       var urlRequest : URLRequest?
       var jsonDecoder : JSONDecoder?
       
    override func viewDidLoad() {
        super.viewDidLoad()
        usersCollectionView.delegate = self
        usersCollectionView.dataSource = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
            
        let uinibName = UINib(nibName:"UsersCollectionViewCell", bundle: nil)
        self.usersCollectionView.register(uinibName, forCellWithReuseIdentifier: "UsersCollectionViewCell")
        // Do any additional setup after loading the view.
        jsonPassingUsingDecoder()
    }
    func jsonPassingUsingDecoder(){
        urlString = "https://dummyjson.com/users"
        url = URL(string: urlString!)
        urlRequest = URLRequest(url: url!)
    
        URLSession.shared.dataTask(with: urlRequest!){ data,response,error in
            print(data as Any)
            print(response as Any)
            if(error == nil){
                do{
        self.jsonDecoder = JSONDecoder()
        let JsonResponse = try self.jsonDecoder?.decode(AndroidModel.self, from: data!)
            self.users = JsonResponse!.users
            self.searchUsers = self.users
                }catch{
                print(error)
                }
            }
            DispatchQueue.main.async {
                self.usersCollectionView.reloadData()
            }
        }.resume()
    }
}

extension AndroidViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchUsers.count
   }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let usersCollectionViewCell = self.usersCollectionView.dequeueReusableCell(withReuseIdentifier: "UsersCollectionViewCell", for: indexPath) as! UsersCollectionViewCell
        let userObject = searchUsers[indexPath.row]
        usersCollectionViewCell.firstNameLabel?.text = userObject.firstName
        let urlString = userObject.image
        let url = URL(string: urlString)
        usersCollectionViewCell.userImage?.sd_setImage(with: url)
        return usersCollectionViewCell
    }
    
        
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
    let viewWidth = view.frame.size.width/2-5
    return CGSize(width: viewWidth, height: viewWidth)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "AndroidDetailsViewController") as! AndroidDetailsViewController
        detailsViewController.user = users[indexPath.row]
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
        
}

extension AndroidViewController:UISearchResultsUpdating,UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else{return}
        if searchText == ""{
            self.searchUsers = self.users
        }
        else{
            
            searchUsers = users.filter({
                return $0.firstName.contains(searchText)
            })
        }
        usersCollectionView.reloadData()
    }
}

