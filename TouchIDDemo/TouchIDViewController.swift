//
//  TouchIDViewController.swift
//  TouchIDDemo
//
//  Created by Neha on 18/01/18.
//  Copyright © 2018 Neha. All rights reserved.
//

import UIKit
import LocalAuthentication

class TouchIDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func clickLoginButton(_ sender: Any)
    {
        self.authenticateUser()
    }

    func authenticateUser() {
        let context : LAContext = LAContext()
        
        // Declare a NSError variable.
        
        let myLocalizedReasonString = "Authentication is needed to access your Home View."
        
        var authError: NSError?
        
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: myLocalizedReasonString) { success, evaluateError in
                
                if success {
                    DispatchQueue.main.async
                        {
                            print("Authentication success by the system")
                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                            let CVC = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                            self.navigationController?.pushViewController(CVC, animated: true)
                    }
                }
                else{
                    // If authentication failed then show a message to the console with a short description.
                    // In case that the error is a user fallback, then show the password alert view.
                    //                    print(evaluateError?.localizedDescription)
                    
                    //                    switch evaluateError!.localizedDescription {
                    //
                    //                    case LAError.SystemCancel.rawValue:
                    //                        print("Authentication was cancelled by the system")
                    //
                    //                    case LAError.UserCancel.rawValue:
                    //                        print("Authentication was cancelled by the user")
                    //
                    //                    case LAError.UserFallback.rawValue:
                    //                        print("User selected to enter custom password")
                    //                        OperationQueue.main.addOperation({ () -> Void in
                    //                            //self.showPasswordAlert()
                    //                        })
                    //
                    //                    default:
                    //                        print("Authentication failed")
                    //                        OperationQueue.main.addOperation({ () -> Void in
                    //                            //self.showPasswordAlert()
                    //                        })
                    //                    }
                    //                }
                }
            }
        }
    }
   

}
