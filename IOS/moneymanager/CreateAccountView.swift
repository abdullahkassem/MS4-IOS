//
//  ViewController.swift
//  moneymanager
//
//  Created by auc on 16/07/2022.
//

import UIKit
import FirebaseAuth
import Foundation
class CreateAccountView: UIViewController {

    @IBOutlet weak var AccountName: UITextField!
    @IBOutlet weak var IntialBalance: UITextField!
    @IBOutlet weak var SharedAcount: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func CreateButton(_ sender: Any) {
        var account:String = ""
        let acc = FirestoreAPI(my_UID: "my_UID")
        acc.addAccount(outstandingBalance: Double(IntialBalance.text!) ?? 0.0, accountName: AccountName.text!)
        let storyboard =  UIStoryboard(name: "Main" , bundle: nil)
        let nextscene = storyboard.instantiateViewController(withIdentifier: "menu")
        nextscene.modalPresentationStyle = .overFullScreen
        present(nextscene, animated: true)
    }
    
}

