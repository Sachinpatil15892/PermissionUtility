//
//  ApplicationRequiredPermission.swift
//  PermissionModel
//
//  Created by Sachin Patil on 1/18/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import UIKit
import Photos
import AVFoundation

typealias PermissionCompletionHandler = (Bool) -> ()
/**
 This class responsible to managing all permission regarding using device resources and frameworks
 
Class is response for Asking following permission.
 1. Photo Permission
 2. Camera Permission
 3. Microphone Permission
 4. Push Notification Permission.
 
 - Requires: Knowledge of all frameworks for asking resource permission.
 
 - Author: Sachin Patil
 
 */
class ApplicationRequiredPermission: NSObject {

    /// This variable is all about creating singleton object for ApplicationRequiredPermission class.
    static let sharedInstance = ApplicationRequiredPermission()
    /**
     Initializer method for ApplicationRequiredPermission class.
     
     ### Important Notes ###
     Reason to kept this method as private because here class is object is singleton class. so according to rule we need to keept it private.
     
     */
    private override init() {
        
    }
    
    /**
     This method check that application's  Photolibrary permission status.
     
     - Author: Sachin Patil
     
     - Returns: PHAuthorizationStatus
     */
    
    func checkThatAppHasPhotoPermission() -> PHAuthorizationStatus{
        
        return PHPhotoLibrary.authorizationStatus()
    }
    
    /**
     This method check that application's  camera permission status.
     
     - Author: Sachin Patil
     
     - Returns: AVAuthorizationStatus
     */
    func checkThatAppHasCameraPermissionForVideo() -> AVAuthorizationStatus{
        
      return  AVCaptureDevice.authorizationStatus(for: .video)
    }
    
    /**
      This method check that application's  microphone access permission status.
     
     - Author: Sachin Patil
     
     - Returns: AVAudioSessionRecordPermission
     */
    func checkThatAppHasMicrophoneAccessPermisssion() -> AVAudioSessionRecordPermission {
        
        return AVAudioSession.sharedInstance().recordPermission()
    }
    
    /**
     This method ask Photo-library access permission.
     - Parameter  PermissionCompletionHandler : completion handler which calls when requesting to access is complete.
     
     - Requires: PhotoFramework Knowledge.
     
     - Author: Sachin Patil
     */
    func askPhotoPermission(_ doneWork: @escaping PermissionCompletionHandler) {
        
        let photoPermissionStatus = checkThatAppHasPhotoPermission()
        if photoPermissionStatus == .notDetermined {
           
            PHPhotoLibrary.requestAuthorization({ (photoPermissionAuthorizationStatus) in
                doneWork(true)
            })
            
        }else{
            
            doneWork(true)
        }
    }
    
    /**
     This method ask Camera access permission.
     - Parameter  PermissionCompletionHandler : completion handler which calls when requesting to access is complete.
     
     - Requires: AVCaptureDevice Knowledge.
     
     - Author: Sachin Patil
     */
    func askCameraPermission(_ doneWork: @escaping PermissionCompletionHandler) {
        
        let cameraPermissionStatus = checkThatAppHasCameraPermissionForVideo()
        if cameraPermissionStatus == .notDetermined  {
            
            AVCaptureDevice.requestAccess(for: .video) { (allowed) in
                 doneWork(true)
            }
            
        }
        else{
            
            doneWork(true)
        }
    }
    
    /**
     This method ask Microphone access permission.
     - Parameter  PermissionCompletionHandler : completion handler which calls when requesting to access is complete.
     
     - Requires: AVAudioSession Fremework Knowledge.
     
     - Author: Sachin Patil
     */
    func askMicrophonePermission (_ doneWork: @escaping PermissionCompletionHandler){
        
        let recordingPermissionStatus = checkThatAppHasMicrophoneAccessPermisssion()
        if recordingPermissionStatus == .undetermined {
            
            AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
                
                doneWork(true)
            })
        }
        else{
            doneWork(true)
        }
        
    }
    
    /**
     This method asks sequece of permission that application requires
     
     # Important Notes #
     Sequence of permission as given below.
     1. Photo Permission.
     2. Camera Permission.
     3. Microphone Permission.
     4. Push Notification Permission.
     
     - Author: Sachin Patil
    
     */
    func askSequenceOfPermission() {
      
        askMicrophonePermission { (grantedPhoto) in
            
            DispatchQueue.main.async {
                
                self.askCameraPermission({ (grantedCamera) in
                    
                    DispatchQueue.main.async {
                       
                        self.askPhotoPermission({ (grantedMicrophone) in
                            
                
                        })
                    }
                })
            }
        }
        
    }
  
}
