//
//  signup.swift
//  moneymanager
//
//  Created by Mohamed Hesham on 19/07/22.
//

import Foundation

import UIKit
import FirebaseAuth
import FirebaseCore
import Firebase




class Signup: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var newemail: UITextField!
    @IBOutlet weak var newpass: UITextField!
    
    @IBOutlet weak var confpass: UITextField!
    
    @IBOutlet weak var register: UIButton!
    

    
    @IBAction func registerpressed(_ sender: Any) {
        
            signup()
    }
    func signup () {
        
        Auth.auth().createUser(withEmail: newemail.text!, password: newpass.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
            let acc = FirestoreAPI(my_UID: "my_UID")
            acc.createUser(username: self.newemail.text!, emailAddress: self.newemail.text!, usablePercentage: 0.0, notification: false, budget: 0.0, currency: "egp")
        }
    }
//    func isValidEmail(_ email: UITextField) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//
//        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailPred.evaluate(with: email)
//    }
//
   
}
