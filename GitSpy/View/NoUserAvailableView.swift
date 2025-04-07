//
//  NoUserAvailableView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-05.
//

import SwiftUI

struct NoUserAvailableView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.badge.exclamationmark")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.gray)
            
            Text("No GitHub User")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            
            Text("Please try a different username")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground).opacity(0.9))
    
    }
}

#Preview {
    NoUserAvailableView()
}
