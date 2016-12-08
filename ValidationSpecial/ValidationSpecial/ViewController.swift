//
//  ViewController.swift
//  ValidationSpecial
//
//  Created by piyush sinroja on 09/09/16.
//  Copyright © 2016 piyush sinroja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UITextField Outlet
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSurName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    // MARK: - UIButton Outlet
    @IBOutlet weak var btnSave: UIButton!
    
    // MARK: - Other
    var arrayTextFields: NSArray!
    var arrayValidationMessages: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSave(_ sender: AnyObject) {
        
        //Please Add textfield Which You Want to Validate
        arrayTextFields = [txtName.text!,txtSurName.text!,txtEmail.text!,txtMobile.text!,txtPassword.text!,txtConfirmPassword.text!]
        
        //Please Add Validation Message Depend on Textfiled index vise
        arrayValidationMessages = [alertmessage.Firstname,alertmessage.SurName,alertmessage.EmailId,alertmessage.MobileNo,alertmessage.Password,alertmessage.ConfirmPassword];
        
        /// All Validation Check
        let check: Bool =   ValidationSpecial.checkAllTextFieldValidation(arrayTextFields, arrayValidationmessage: arrayValidationMessages)
        
        if check == true{
            // Success Do Next Step Here
            ValidationSpecial.alertView(alertmessage.Apptitle, strMessage:"All Validation Success")
        }
        
    }
}

/**
 *   Structure For Alert Messages
 */
struct alertmessage {
    static var Apptitle   :   String = "Your App Title"
    static var Firstname   :   String = "Please Enter Firstname"
    static var SurName   :   String = "Please Enter SurName"
    static var MobileNo   :   String =  "Please Enter MobileNo"
    static var EmailId   :   String =  "Please Enter Valid EmailId"
    static var Password   :   String =  "Please Enter Password"
    static var ConfirmPassword   :   String =  "Please Enter Confirm Password"
    static var Submited   :   String = "Details Submited SuccessFully"
    static var MobileExits   :   String = "Mobile No Already Exits"
    
    
    static var ValidMobileNo   :   String =  "Please Enter Valid Mobile No"
    static var ReqPassword   :   String =  "Password Should be minimum 6 character Length"
    static var PassMatch   :   String =  "Password and Confirm Password Should be Same"
    
    
}
