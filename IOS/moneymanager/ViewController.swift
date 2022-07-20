//
//  ViewController.swift
//  moneymanager
//
//  Created by auc on 16/07/2022.
//

import UIKit
import FirebaseAuth
import Foundation
class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
   
    var link: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginpressed(_ sender: Any) {
        var account:String = ""
        let acc = FirestoreAPI(my_UID: "my_UID")
        account = acc.ReadAccounts()
        login()
    }
    
//    func loginver () {
//        sendFirebaseEmailLink()
//        signInUserAfterEmailLinkClick()
//
//    }
//        func sendFirebaseEmailLink() {
//
//            let actionCodeSettings = ActionCodeSettings.init()
//            let email = email.text!
//            actionCodeSettings.url = URL.init(string: String(format: "https://<aucegypt>.page.link/emaillogin/?email=%@", email))
//            // The sign-in operation has to always be completed in the app.
//            actionCodeSettings.handleCodeInApp = true
//            actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
//
//            Auth.auth().sendSignInLink(toEmail: email,
//                actionCodeSettings: actionCodeSettings) { error in
//
//                if let error = error {
//                    print(error.localizedDescription)
//                    return
//                }
//                else {
//                    UserDefaults.standard.set(email, forKey: "Email")
//                    print("email sent to user")
//                }
//
//                // TODO: Notify user to check email and click the link.
//            }
//        }
//
//        // Sign in user after they clicked email link called from AppDelegate
//         func signInUserAfterEmailLinkClick() {
//
//            // Get link url string from the dynamic link captured in AppDelegate.
//            if let link = UserDefaults.standard.value(forKey: "Link") as? String {
//                self.link = link
//            }
//
//            // Sign user in with the link and email.
//             Auth.auth().signIn(withEmail: email.text!, link: link!) { (result, error) in
//
//                if error == nil && result != nil {
//
//                    if (Auth.auth().currentUser?.isEmailVerified)! {
//                        print("User verified with passwordless email")
//
//                        // TODO: Do something after user verified like present a new View Controller
//
//                    }
//                    else {
//                        print("User NOT verified by passwordless email")
//
//                    }
//                }
//                else {
//                    print("Error with passwordless email verfification: \(error?.localizedDescription ?? "Strangely, no error avaialble.")")
//                }
//            }
//        }

   

    
    func login() {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, err in
            
            guard let strongSelf = self else {return}
            
            if let err = err {
                print(err.localizedDescription)
            }
            self?.checkUserInfo()
        }
        
    }

    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard =  UIStoryboard(name: "Main" , bundle: nil)
            let nextscene = storyboard.instantiateViewController(withIdentifier: "menu")
            nextscene.modalPresentationStyle = .overFullScreen
            present(nextscene, animated: true)
        }
    }
  
}
