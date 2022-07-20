//
//  ViewController.swift
//  moneymanager
//
//  Created by auc on 16/07/2022.
//

import UIKit
import FirebaseAuth
import Foundation
class AccountView: UIViewController {
    
    @IBOutlet weak var AccountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var account:String = ""
        account = viewAccount()
        self.AccountLabel.text = account

    }
    
    func viewAccount() -> String {
        var account:String = ""
        let acc = FirestoreAPI(my_UID: "my_UID")
        account = acc.ReadAccounts()
        return account
        //self.AccountLabel.text = account
        
    }
}
