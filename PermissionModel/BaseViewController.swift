//
//  BaseViewController.swift
//  PermissionModel
//
//  Created by Sachin Patil on 1/23/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

     // MARK: - View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationControllerSetup()
        self.setStatusBarBackgroundColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - NavigationViewController SetupMethods
    
    /**
     This method setup naviagtionbar properties accroding app themes for allview controller in application.
     
     ### Important Notes ###
     This method setup following properties for naviagtioncontoller.
     1. NavigationBar title color
     2. NavigationBar title fonts
     3. NavigationBar Tint Color.
     
     - Author: Sachin Patil
    
     */
    private func navigationControllerSetup(){
        
        if let applicationNavigationController = self.navigationController{
            
            let navigationBarTitleTextAttritbutes = [NSAttributedStringKey.foregroundColor:AppUsedConstantValues.ApplicationNavigationSetupConstants.AppNavigationBarTitleTextColor]
            
            applicationNavigationController.navigationBar.titleTextAttributes = navigationBarTitleTextAttritbutes
            
            applicationNavigationController.navigationBar.isTranslucent = false
            applicationNavigationController.navigationBar.tintColor = AppUsedConstantValues.ApplicationNavigationSetupConstants.AppNavigationTintColor
            
            self.setNeedsStatusBarAppearanceUpdate()
            
        }
    }
    
    /**
     This method setup naviagtionbar statusbar background color properties accroding app themes for allview controller in application.
     
     - Author: Sachin Patil
     
     */
    private func setStatusBarBackgroundColor(){
        
        if let statusBar:UIView =  UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView{
            
            if statusBar.responds(to: #selector(setter: UIView.backgroundColor)){
                
                statusBar.backgroundColor = AppUsedConstantValues.ApplicationNavigationSetupConstants.AppThemeColor
            }
            
        }
        
    }
    
    /**
     This method responsible to present command alerts in system that have only single button such as most general message alerts
     - Parameter  withTitle : Set title for Alert to present.
     - Parameter  WithMessage : Set message to on alert.
     - Parameter  defaultButtonTitle : Default button tile shown on alert.
     
     - Author: Sachin Patil
     
     */
    public func showAlert(withTitle title:String, WithMessage message:String, defaultButtonTitle defaultButton:String){
        
        let alertController = UIAlertController.init(title: "", message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction.init(title: defaultButton, style: .cancel) { (defaultButtonAction) in
            
            alertController.dismiss(animated: true, completion: {
                
            })
        }
        
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true) {
            
        }
    }
    
    /**
     This method responsible to shown progress loader on View
     - Parameter  WithTitle : Title to show on loader.
     
     - Author: Sachin Patil
     */
    public func showProgressLoader(WithTitle title:String){
    
    
    }
    
    /**
     This method responsible to hide progress loader on View
     
     - Author: Sachin Patil
     */
    public func hideProgressLoader(){
        
        
    }
    
    /**
     This method get the viewcontroller from their identifier
     - Parameter  vcIdentifier : ViewController Identifier
     
     - Author: Sachin Patil
     
     - Returns: UIViewController
     */
    public func getViewControllerForIdentifier(_ vcIdentifier: String) -> UIViewController?{
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: vcIdentifier)
        return vc;
        
        
    }
    
    public func isNetworkAvailable() -> Bool{
    
    // To DO: - Newtwork reachability test code goes here.
    return true
    }
}
