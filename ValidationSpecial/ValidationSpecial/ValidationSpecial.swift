//
//  ValidationSpecial.swift
//  ValidationSpecial
//
//  Created by piyush sinroja on 09/09/16.
//  Copyright © 2016 piyush sinroja. All rights reserved.
//

import UIKit

class ValidationSpecial: NSObject {
    
    
    /**
     All Textfield Validation
     
     - parameter arraytextfield:         Array of Textfields
     - parameter arrayValidationmessage: Array of Message of Validation Textfield
     
     - returns: True/False
     */
    
    //MARK:-  Validation
    static func checkAllTextFieldValidation(_ arraytextfield: NSArray, arrayValidationmessage: NSArray)-> Bool
    {
        // Please check textfield index which you passed in arraytextfield
        
        for i in 0 ..< arraytextfield.count
        {
            let strtemp :String = arraytextfield[i] as! String
            print(strtemp)
            switch strtemp{
            case strtemp:
                if strtemp.isEmpty || strtemp.isKind(of: NSNull.self){
                    ValidationSpecial.alertView(alertmessage.Apptitle, strMessage: arrayValidationmessage[i] as! String)
                    return false
                }
                else{
                    if i == 2 // Email Validation
                    {
                        
                        let checkmail: Bool = emailAdrressValidation(strtemp)
                        if checkmail == false {
                          return false
                        }
                    }
                    if i == 3  // Mobile Validation
                    {
                        let checkmobile: Bool = myMobileNumberValidate(strtemp)
                        if checkmobile == false {
                            return false
                        }
                    }
                    else if i == 4 // PasswordValidation Should 6 Character Length
                    {
                        let checkPass: Bool = passWordValidation(strtemp)
                        if checkPass == false {
                            return false
                        }
                    }
                    else if i == 5 // Confirm Pass (Both Pass Should be Same)
                    {
                        let passmatch: Bool = passwordMatch(strtemp, confirmPassword: arraytextfield[i-1] as! String)
                        if passmatch == false {
                            return false
                        }
                    }
                }
            default:
                print("Novalidation")
                return false
            }
        }
        return true
    }
    
    //MARK:-  alertView
    static func alertView(_ strTitle:String,strMessage:String){
        let alert:UIAlertView = UIAlertView(title: strTitle as String, message: strMessage as String, delegate: nil, cancelButtonTitle: "ok")
        
        DispatchQueue.main.async(execute: {
            alert.show()
        })
    }
    
    static func alertController(_ strTitle:String,strMessage:String, selfclass: UIViewController ){
        
        // Initialize Alert Controller
        let alertController = UIAlertController(title:strTitle , message:strMessage , preferredStyle: UIAlertControllerStyle.alert)
        
        // Initialize Actions
        let yesAction = UIAlertAction(title: "Cancel", style: .default){
            (action) -> Void in
            print("Cancel.")
        }
        let noAction = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
            print("Ok.")
        }
        
        // Add Actions
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        // Present Alert Controller
        
        DispatchQueue.main.async{
            () -> Void in
            selfclass.present(alertController, animated: true, completion: nil)
        }
    }
    
    /**
     Email Validation
     
     - parameter strEmail: Email
     
     - returns: True/False
     */
    static func emailAdrressValidation(_ strEmail : String)->Bool{
        
        //Email address should accept like:test@gmail.co.uk
        
        let emailRegEx = "[.0-9a-zA-Z_-]+@[0-9a-zA-Z.-]+\\.[a-zA-Z]{2,20}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailTest.evaluate(with: strEmail){
            ValidationSpecial.alertView(alertmessage.Apptitle, strMessage:alertmessage.EmailId)
            return false
        }
        return true
    }
    
    //MARK:- passWordValidation
    
    /**
     Password Validation
     
     - parameter password: Password
     
     - returns: True/False
     */
    
    static func passWordValidation(_ password : String)->Bool{
        if password.characters.count >= 6 && password.characters.count <= 15{
            return true
        }
        else{
            ValidationSpecial.alertView(alertmessage.Apptitle, strMessage:alertmessage.ReqPassword)
            return false
        }
    }
    
    /**
     Password - Confirm Password Match Validation
     
     - parameter password:        Password
     - parameter confirmPassword: ConfirmPassword
     
     - returns: True/False
     */
    
    static func passwordMatch(_ password: String , confirmPassword : String) -> Bool {
        if password == confirmPassword {
            return true
        }
        else{
             ValidationSpecial.alertView(alertmessage.Apptitle, strMessage:alertmessage.PassMatch)
            return false
        }
    }

    /**
     Mobile Validation
     
     - parameter number: Mobile/Cellphone Number
     
     - returns: True/False
     */
    static func myMobileNumberValidate(_ number: String) -> Bool {
        let numberRegEx = "[0-9]{10,15}"
        let numberTest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        if !numberTest.evaluate(with: number){
            ValidationSpecial.alertView(alertmessage.Apptitle, strMessage:alertmessage.ValidMobileNo)
            return false
        }
        return true
        
    }
    
}
