//
//  MenuListRow.swift
//  API
//
//  Created by DGF on 12/6/22.
//

import SwiftUI

struct MenuListRow: View {
    @StateObject var viewModel : ViewModel = ViewModel()
    var menuItem : Domain
    var body: some View {
        HStack(){
            URLPatch(urlString: menuItem.links ?? "video", data: nil)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading){
                Text(menuItem.name).bold()
                Text(menuItem.launchSite ?? "Launch Site").fontWeight(.light)
            }
        }
    }
}

struct MenuListRow_Previews: PreviewProvider {
   
    static var previews: some View {
        Group{
            MenuListRow(menuItem: Domain())
        }
    }
}
