//
//  UserdefaultsManager.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 08/02/23.


import Foundation
import UIKit

class UserDefaultsManager{
    
    static let shared = UserDefaultsManager()
    let defaults = UserDefaults.standard
    
    
    //MARK: SET
    func setUserType(user: String){
        defaults.set(user, forKey: "userType")
    }
    
    func setUserImage(img: String){
        defaults.set(img, forKey: "userImage")
    }
    
    func setWorkerMode(mode: Bool){
        defaults.set(mode, forKey: "workerMode")
    }
    
    //MARK: GET
    func getUserType()->String{
        defaults.string(forKey: "userType") ?? "Unknown"
    }
    
    func getWorkerMode()->Bool{
        defaults.bool(forKey: "workerMode")
    }
    
    func getUserImage()->String {
        defaults.string(forKey: "userImage") ?? ""
    }
    
    
}
