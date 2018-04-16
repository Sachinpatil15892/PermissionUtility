//
//  ApplicationPermissionModel.swift
//  PermissionModel
//
//  Created by Sachin on 1/4/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import UIKit
import Photos
import AVFoundation


/**
    This class is for Permissions. This class describes all permission that app required for doing the task
 
    ### Usage Example: ###
         PHPhotoLibrary.requestAuthorization({ (photoPermissonAuthorizationStatus) in
         })
 
    ## Important Notes ##
    1. Class Responsible to ask all permission to the user at once when app launches
    2. Class check that app has permissions granted by user or not.
 
 ### Remark: ###
    This class is SingleTon class
 */
class ApplicationPermissionModel: NSObject {

    /// This variable is static which responsible to create **Singleton**
    static let sharedInstance = ApplicationPermissionModel()
    
    /**
     This class is for Permissions. This class describes all permission that app required for doing the task
     
     ### Usage Example: ###
     PHPhotoLibrary.requestAuthorization({ (photoPermissonAuthorizationStatus) in
     })
     
     ## Important Notes ##
     1. Class Responsible to ask all permission to the user at once when app launches
     2. Class check that app has permissions granted by user or not.
     
     ### Remark: ###
     This class is SingleTon class
     */
    private override init() {
        
    }
    
    /**
     This class is for Permissions. This class describes all permission that app required for doing the task
     
     ### Usage Example: ###
     PHPhotoLibrary.requestAuthorization({ (photoPermissonAuthorizationStatus) in
     })
     
     ## Important Notes ##
     1. Class Responsible to ask all permission to the user at once when app launches
     2. Class check that app has permissions granted by user or not.
     
     ### Remark: ###
     This class is SingleTon class
     */
    func checkThatAppHasPhotoPermission() -> PHAuthorizationStatus{
        
        let photoPermissionStatus : PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        return photoPermissionStatus
    }
    
    /**
     Description : - abc
     - Parameter  param-name : abc
     
     ### Important Notes ###
     Note One
     
     - Remarks:
     Remark One
     
     - Precondition:
     preconditions
     
     - Requires: Requirement Description
     
     - Author: Author Name
     
     | Tables        | Are           | Cool   |
     | ------------- |:-------------:| -----: |
     | col 3 is      | right-aligned |  $1600 |
     | col 2 is      | centered      |   $12  |
     | zebra stripes | are neat      |    $1  |

     
     - Returns: abc
     
     */
    func askForPhotoPermission() {
        
       let photoPermissionStatus = self.checkThatAppHasPhotoPermission()
        if photoPermissionStatus == .notDetermined {
            
            PHPhotoLibrary.requestAuthorization({ (photoPermissonAuthorizationStatus) in
                
                
            })
        }
    }
    
    /**
     This class is for Permissions. This class describes all permission that app required for doing the task
     
     ### Usage Example: ###
     PHPhotoLibrary.requestAuthorization({ (photoPermissonAuthorizationStatus) in
     })
     
     ## Important Notes ##
     1. Class Responsible to ask all permission to the user at once when app launches
     2. Class check that app has permissions granted by user or not.
     
     ### Remark: ###
     This class is SingleTon class
     */
    func askForCameraPermission(){
        
        AVCaptureDevice.requestAccess(for: .video) { (allowed) in
            
        }
        
    }
    
    /**
     This class is for Permissions. This class describes all permission that app required for doing the task
     
     ### Usage Example: ###
     PHPhotoLibrary.requestAuthorization({ (photoPermissonAuthorizationStatus) in
     })
     
     ## Important Notes ##
     1. Class Responsible to ask all permission to the user at once when app launches
     2. Class check that app has permissions granted by user or not.
     
     ### Remark: ###
     This class is SingleTon class
     */
    func askSequenceOfPermission(){
        
        let photoPermissionStatus = self.checkThatAppHasPhotoPermission()
        if photoPermissionStatus == .notDetermined {
            
            PHPhotoLibrary.requestAuthorization({ (photoPermissonAuthorizationStatus) in
                
               let permission = AVCaptureDevice.authorizationStatus(for: .video)
                if permission == .notDetermined{
                    
                    AVCaptureDevice.requestAccess(for: .video) { (allowed) in
                        
                    }
                }
            })
        }
        else{
            
            let permission = AVCaptureDevice.authorizationStatus(for: .video)
            if permission == .notDetermined{
                
                AVCaptureDevice.requestAccess(for: .video) { (allowed) in
                    
                }
            }
        }
        
    }
    
}
