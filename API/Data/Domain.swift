//
//  Domain.swift
//  API
//
//  Created by DGF on 12/6/22.
//

import Foundation
struct Domain : Hashable,Identifiable {
    var  id : Int? 
    var name: String = "Demo Sat"
    var date: String = ""
    var rocket: String = ""
    var details: String? = ""
    var launchSite: String?
    var links: String?
    var image: String?
    var year : String?
    var success : Bool?
    
}
