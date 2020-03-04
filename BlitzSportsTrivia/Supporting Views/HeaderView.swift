//
//  HeaderView.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 3/2/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    
    var body: some View {
        VStack(spacing:0){
            Text("Blitz")
                .font(.title)
                .foregroundColor(Color.yellow)
                
            HStack(spacing:0){
                Text("Sports")
                    .font(.title)
                    .foregroundColor(Color.yellow)
                
                Image("Trophy").resizable().frame(width:120, height:80, alignment: .center).padding(0)
                Text("Trivia")
                    .font(.title)
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
