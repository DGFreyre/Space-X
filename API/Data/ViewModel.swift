//
//  ViewModel.swift
//  API
//
//  Created by DGF on 12/5/22.
//

import Foundation
import SwiftUI

class ViewModel : ObservableObject {
    @Published var missions: [Domain] = [ ]
    
    
    var categories: [Int : [Domain]]{
        Dictionary(
            grouping: missions,
            by: {$0.id!})
    }
    
    func fetch(){
        
        guard let url = URL(string:"https://api.spacexdata.com/v3/launches") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error ==  nil else {
                return
            }
            
            do{
                let missionListResponse = try JSONDecoder().decode([ResponseAPI].self, from: data)
                
                var missionList = [Domain]()
                for missionResponse in missionListResponse  {
                    var misssion = Domain()
                    misssion.name =  missionResponse.name
                    misssion.date = missionResponse.date
                    misssion.links = missionResponse.links.missionPatch
                    misssion.details = missionResponse.details
                    misssion.launchSite = missionResponse.launchSite.siteName.rawValue
                    misssion.year = missionResponse.launchYear
                    misssion.rocket = missionResponse.rocket.rocketName.rawValue
                    misssion.success = missionResponse.launchSuccess
                    if missionResponse.links.flickrImages?.count != 0 {
                        misssion.image = missionResponse.links.flickrImages?[0] ?? "https://farm9.staticflickr.com/8617/16789019815_f99a165dc5_o.jpg"
                    }
                   
                  
                    missionList.append(misssion)
                }
                DispatchQueue.main.async {
                    //print(missionList)
                    self?.missions = missionList
                }
                
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
}
