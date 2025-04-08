//
//  NoUserAvailableView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-05.
//

import SwiftUI

struct NoUserAvailableView: View {
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            // Displaying the image with consistent styling
            Image(systemName: Constants.noUserAvailableImage)
                .resizable()
                .imageStyle(width: 80, height: 80) // Apply custom style for images
            
            // Displaying no user available text with styling
            Text(Constants.noUserAvailable)
                .textStyle(fontSize: .title3, fontWeight: .semibold, textColor: .gray)
            
            // Displaying the error message text with styling
            Text(Constants.errorMessage)
                .textStyle(fontSize: .subheadline, fontWeight: .regular, textColor: .secondary)
        }
        .padding()
        .noUserViewStyle()
    }
}

// MARK: - Preview
#Preview {
    NoUserAvailableView()
}

