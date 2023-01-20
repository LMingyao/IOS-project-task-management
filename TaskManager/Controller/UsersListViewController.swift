//
//  UsersListViewController.swift
//  TaskManager
//
//  Created by Daniel Carvalho on 23/10/22.
//

import UIKit

protocol UsersListViewControllerDelegate {
    
    func userListViewController( selectedUser user : UserModel )
    
}


class UsersListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var delegate : UsersListViewControllerDelegate?

    @IBOutlet var tableView : UITableView!
    @IBOutlet var searchBar: UITextField!
    @IBOutlet var actBusy : UIActivityIndicatorView!
    var filterdata = DataSource.allUsers
    
    @IBAction func Search(_ sender: UITextField) {
        
      filterdata = []
        
        if let searchText = sender.text {
                
            if searchText == ""{
                filterdata = DataSource.allUsers
            }
            else{
                for user in DataSource.allUsers{
                    if user.name.uppercased().contains(searchText.uppercased()),
                       user.email.uppercased().contains(searchText.uppercased())
                    {
                        filterdata.append(user)
                    }
                }
            }
            self.tableView.reloadData()
            
        }
        
    }
    
    
    
   
    
    
    private var busy : Bool = false {
        didSet{
            DispatchQueue.main.async {
                if self.busy {
                    self.actBusy.isHidden = false
                    self.actBusy.startAnimating()
                } else {
                    self.actBusy.isHidden = true
                    self.actBusy.stopAnimating()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customizeView()
        
        initialize()
        
    }
    
    func initialize() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let myCustomCell = UINib(nibName: "UserTableViewCell", bundle: nil)
        
        tableView.register(myCustomCell, forCellReuseIdentifier: "UserTableViewCell")
    }

    func customizeView() {
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        cell.setContent(user: filterdata[indexPath.row])
        
        if filterdata[indexPath.row].uid == Session.loggedUser!.uid {
            cell.imgStar.isHidden = false
        }
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdata.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedUser = filterdata[indexPath.row]
        
        if delegate != nil {
            delegate!.userListViewController(selectedUser: selectedUser)
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
