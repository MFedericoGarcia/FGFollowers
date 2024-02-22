//
//  FollowerView.swift
//  GHFollowers
//
//  Created by Fede Garcia on 26/04/2024.
//

import SwiftUI



struct FollowerView: View {
    
    var follower: Follower
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: follower.avatarUrl)){ image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image("avatar-plaveholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .clipShape(Circle())
            Text(follower.login)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.6)
            
        }
    }}

#Preview {
    FollowerView(follower: Follower(login: "Fede Garcia", avatarUrl: ""))
}
