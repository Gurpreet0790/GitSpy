//
//  UserAvatarView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-07.
//

import SwiftUI

struct UserAvatarView: View {
    
    // MARK: - Properties
    let imageURL: String
    let width: CGFloat
    let height: CGFloat
    
    // MARK: - Body
    var body: some View {
        if let url = URL(string: imageURL) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .imageStyle(width: width, height: height)
        }
    }
}

// MARK: - Preview
#Preview {
    UserAvatarView(imageURL: Constants.mockUserImage,width: 50, height: 50)
}
