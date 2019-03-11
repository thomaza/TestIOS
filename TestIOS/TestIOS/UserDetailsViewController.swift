//
//  UserDetailsViewController.swift
//  TestIOS
//
//  Created by Arnaud Thomazo on 06/03/2019.
//  Copyright © 2019 Arnaud Thomazo. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var userDetailView: UserDetailView!
    
    var user: UserModelItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.topItem?.title = (user?.title)! + " " + (user?.firstName)! + " " + (user?.lastName)!
        userDetailView.configureWithItem(item: user!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    @IBAction func closeUserDetailsAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
