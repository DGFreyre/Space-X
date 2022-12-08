//
//  ButtonNotification.swift
//  API
//
//  Created by DGF on 12/8/22.
//

import SwiftUI

struct ButtonNotification: View {
    @Binding  var placeOrder : Bool
    @EnvironmentObject private var locationManager: LocationManager
    let menuItem : Domain
    
    var body: some View {
            Button(action: nearbyPlace) {
            Text("Launch Site:" + " " + (menuItem.launchSite ?? "Sorry we don't have the location"))
                .foregroundColor(.white)
                .frame(minWidth: 100, maxWidth: .infinity)
                .frame(height: 45)
            }.background(Color("Pink"))
            .cornerRadius(5.0).frame(maxWidth: 300)
    
        .alert(isPresented: $placeOrder) {
        Alert(
          title: Text("Launch Site"),
          message:
            Text("""
              You are near a rocket launching area.
              Do you want to be notified when you are near?
              """),
          primaryButton: .default(Text("Yes")) {
            requestNotification()
          },
          secondaryButton: .default(Text("No"))
        )
      }
}
    
    func nearbyPlace() {
        placeOrder = true
      }
    func requestNotification() {
      locationManager.validateLocationAuthorizationStatus()
    }
}

struct ButtonNotification_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNotification(placeOrder:.constant(false), menuItem: Domain())
    }
}
