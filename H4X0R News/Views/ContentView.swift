//
//  ContentView.swift
//  H4X0R News
//
//  Created by Julia Vasilchenko on 13/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(networkManager.posts) {
                    post in
                    if let safeUrl = post.url {
                        Link(destination:URL(string: safeUrl)!) {
                            HStack {
                                Text(String(post.points))
                                Text(post.title)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("H4X0R News")
        }
        .onAppear{
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


