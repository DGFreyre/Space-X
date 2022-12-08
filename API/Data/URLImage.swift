//
//  URLImage.swift
//  API
//
//  Created by DGF on 12/5/22.
//

import SwiftUI
struct URLPatch : View{
    let urlString : String
    @State var data : Data?
    var body : some View {
        if let data = data, let uiimage = UIImage(data:data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
        }else{
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .onAppear{
                    fetchData()
                    
            }
        }
    }
    
    private func fetchData(){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data, _, _ in
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }

}

struct URLPatchBig : View{
    let urlString : String
    @State var data : Data?
    var body : some View {
        if let data = data, let uiimage = UIImage(data:data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
        }else{
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .onAppear{
                    fetchData()
                    
            }
        }
    }
    
    private func fetchData(){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data, _, _ in
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }

}
struct URLImageCircle : View{
    let urlString : String
    @State var data : Data?
    var body : some View {
        if let data = data, let uiimage = UIImage(data:data){
            Image( uiImage: uiimage)
                .renderingMode(.original)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(100)
        }else{
            Image("123")
                .renderingMode(.original)
                .resizable()
                .frame(width:200, height: 200)
                .cornerRadius(100)
                .onAppear{
                    fetchData()
                    
            }
        }
    }
    private func fetchData(){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data, _, _ in
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
struct URLImage : View{
    let urlString : String
    @State var data : Data?
    var body : some View {
        if let data  = data, let uiimage = UIImage(data:data){
            Image(uiImage: uiimage)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .listRowInsets(EdgeInsets())
        }else{
            Image("launch")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .listRowInsets(EdgeInsets())
                .onAppear{
                    fetchData()
                    
            }
        }
    }
    
    private func fetchData(){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data, _, _ in
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }

}
struct URLImageSmall : View{
    let urlString : String
    @State var data : Data?
    var body : some View {
        if let data  = data, let uiimage = UIImage(data:data){
            Image(uiImage: uiimage)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 80)
                .clipped()
                .cornerRadius(5)
            
        }else{
            Image("launch")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 80)
                .clipped()
                .cornerRadius(5)
    
                .onAppear{
                    fetchData()
                    
            }
        }
    }
    
    private func fetchData(){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data, _, _ in
            DispatchQueue.main.async {
                self.data = data
            }
           
        }
        task.resume()
    }

}

struct Image_Previews: PreviewProvider {
    static var previews: some View {
        URLPatch(urlString: "https://api.spacexdata.com/v3/launches")
        URLImage(urlString: "https://api.spacexdata.com/v3/launches")
        URLImageSmall(urlString: "https://api.spacexdata.com/v3/launches")
        URLImageCircle(urlString: "https://api.spacexdata.com/v3/launches")
        URLPatchBig(urlString: "https://api.spacexdata.com/v3/launches")
    }
}


