//
//  UserDefaultUtility.swift
//  PermissionModel
//
//  Created by Sachin Patil on 1/23/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import UIKit

class UserDefaultUtility: NSObject {

    /// This variable is all about crating singleton object for ApplicationRequiredPermission class.
    static let sharedInstance = UserDefaultUtility()
    
    /**
     Initializer method for UserDefaultUtility class.
     
     ### Important Notes ###
     Reason to kept this method as private because here class is object is singleton class. so according to rule we need to keept it private.
     
     */
    private override init() {
        
    }
    
    /**
     This methods save string value to userdefault by checking that it should not nil.
     - Parameter  stringToSave : String value to save in UserDefault
     - Parameter  ForKey : key for which value to save in UserDefault
     
     - Author: Sachin Patil
     
     - Returns: abc
     */
    public func saveStringForUserDefault(stringToSave strValue: String?, ForKey key:String){
        
        if let valueToSave = strValue{
            
            UserDefaults.standard.set(valueToSave, forKey: key)
        }
        else{
            
            UserDefaults.standard.setValue("", forKey: key)
        }
        UserDefaults.standard.synchronize()

    }
    
    /**
     This methods save Integer value to userdefault by checking that it should not nil.
     - Parameter  IntToSave : Integer value to save in UserDefault
     - Parameter  ForKey : key for which value to save in UserDefault
     
     - Author: Sachin Patil
     
     - Returns: abc
     */
    public func saveIntegerValueForUserDefault(IntToSave intValue: Int?, ForKey key:String){
        
        if let valueToSave = intValue{
            
            UserDefaults.standard.set(valueToSave, forKey: key)
    
        }
        else{
            
            UserDefaults.standard.setValue(0, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    /**
     This methods save Double value to userdefault by checking that it should not nil.
     - Parameter  doubleToSave : Duuble value to save in UserDefault
     - Parameter  ForKey : key for which value to save in UserDefault
     
     - Author: Sachin Patil
     
     - Returns: abc
     */
    public func saveDoubleValueForUserDefault(doubleToSave dobuleValue: Double?, ForKey key:String){
        
        if let valueToSave = dobuleValue{
            
            UserDefaults.standard.set(valueToSave, forKey: key)
            
        }
        else{
            
            UserDefaults.standard.setValue(0.0, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    /**
     This methods save Bool value to userdefault by checking that it should not nil.
     - Parameter  boolToSave : Bool value to save in UserDefault
     - Parameter  ForKey : key for which value to save in UserDefault
     
     - Author: Sachin Patil
     
     - Returns: abc
     */
    public func saveBoolValueForUserDefault(boolToSave boolValue: Bool?, ForKey key:String){
        
        if let valueToSave = boolValue{
            
            UserDefaults.standard.set(valueToSave, forKey: key)
            
        }
        else{
            
            UserDefaults.standard.setValue(false, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    /**
     This methods remove value for key from userdefault .
     - Parameter  ForKey : key for which value to delete from UserDefault
     
     - Author: Sachin Patil
     
     - Returns: abc
     */
    public func removeValueFromUserDefault(forKey key:String){
        
        UserDefaults.standard.removeObject(forKey: key);
        UserDefaults.standard.synchronize()
    }
}
