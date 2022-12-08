//
//  MissionDetail.swift
//  API
//
//  Created by DGF on 12/5/22.
//

import SwiftUI
import _MapKit_SwiftUI

struct MissionDetail: View {
    
    @EnvironmentObject private var locationManager: LocationManager
    @State private var placeOrder = false
    @StateObject var viewModel : ViewModel = ViewModel()
    let menuItem : Domain
    
    
   /* var missionIndex: Int {
        viewModel.mission.firstIndex(where: { $0.id == menuItem.id })!
    }*/

    var body: some View {
    
            ZStack {
                //Color.black.ignoresSafeArea(.all)
                
                
                VStack() {
                        CapsuleView(menuItem: menuItem, color: Color("Pinki"),text: "Rocket:")
                        URLImageCircle(urlString: menuItem.image ?? "123")
                        Text(menuItem.name).font(.system(size: 40)).fontWeight(.heavy)
                        Text(menuItem.launchSite ?? "No description").font(.title2)
                        Divider()
                        Text(menuItem.details ?? "").font(.caption).padding()
                        URLPatchBig(urlString: menuItem.links ?? "video").padding(.bottom, 30)
                        ButtonNotification(placeOrder: $placeOrder, menuItem: menuItem)
                }
                
            }
            
        
        
    }
}

struct MissionDetail_Previews: PreviewProvider {
    static let modelData = ViewModel()
    static var previews: some View {
        MissionDetail( menuItem: Domain()).environmentObject(modelData)
    }
}
