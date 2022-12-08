//
//  MissionRow.swift
//  API
//
//  Created by DGF on 12/7/22.
//

import SwiftUI

struct MissionListRow: View {
    var item: Domain

    var body: some View {
        HStack {
            URLPatch(urlString: item.image ?? "launch")
           
            Text(item.name)

            Spacer()

            if item.success ?? true {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }}

struct MissionListRow_Previews: PreviewProvider {
    static var items = ViewModel().missions
    static var previews: some View {
        
            MissionListRow(item:Domain() )
         
          .previewLayout(.fixed(width: 300, height: 70))
    }
}
