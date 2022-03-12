//
//  ContentView.swift
//  SwiftUIAsyncImage
//
//  Created by Metin Atalay on 11.03.2022.
//

import SwiftUI

extension Image {
    func imageModefiler() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModofier() -> some View {
        self
            .imageModefiler()
            .frame(maxWidth:120)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
    
}


struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        
        //MARK -1 : .basic
        
        //AsyncImage(url: URL(string: imageURL))
        
        //MARK -2  : Scale
        
        //AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        // MARK -3 PlaceHolder
        /*
        AsyncImage(url: URL(string: imageURL)){ image in
            image
                .imageModefiler()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .iconModofier()
        }.padding(40)
         */
        
        // MARK - 4 Animation
        
        /*AsyncImage(url: URL(string: imageURL)){phase in
            if let image = phase.image {
                image.imageModefiler()
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModofier()
            } else {
                Image(systemName: "photo.circle.fill").iconModofier()
            }
        }.padding(40) */
        
        //MARK -5 Animation
        
        AsyncImage(url: URL(string: imageURL),transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))){phase in
            if let image = phase.image {
                image.imageModefiler()
                  //  .transition(.slide)
                    .transition(.scale)
                //transition(.move(edge: .bottom))
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModofier()
            } else {
                Image(systemName: "photo.circle.fill").iconModofier()
            }
        }.padding(40)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
