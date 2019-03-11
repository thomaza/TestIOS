//
//  UsersTableViewController.swift
//  TestIOS
//
//  Created by Arnaud Thomazo on 28/02/2019.
//  Copyright © 2019 Arnaud Thomazo. All rights reserved.
//

import UIKit

class UsersTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var dataArray = [UserModelItem]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    private let dataSource = UserDataModel()
    private let refreshControl = UIRefreshControl()
    
    private var pageNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView?.register(UserTableViewCell.nib, forCellReuseIdentifier: UserTableViewCell.identifier)
        
        dataSource.delegate = self
        tableView?.delegate = self
        tableView?.dataSource = self
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshUsersData(_:)), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if pageNumber ==  0 {
            setUpUsers(page: pageNumber)
        }
    }
    
    @objc private func refreshUsersData(_ sender: Any) {
        pageNumber = 0
        dataSource.requestData(page: pageNumber)
    }
    
    @objc func setUpUsers(page: Int) {
        dataSource.requestData(page: page)
    }
}

extension UsersTableViewController: UITableViewDelegate {
    
}

extension UsersTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:
            UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
        {
            cell.configureWithItem(item: dataArray[indexPath.item])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == dataArray.count - 1 {
            pageNumber += 1
            setUpUsers(page: pageNumber)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "UserDetailsViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        vc.user = dataArray[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
}
    
    
    

extension UsersTableViewController: UserDataModelDelegate {
    
    func didFailDataUpdateWithError(error: Error) {
        print(error)
    }
    
    func didRecieveDataUpdate(data: [UserModelItem]) {
        if pageNumber > 1 {
            dataArray += data
        } else {
            dataArray = data
        }
    }
}
