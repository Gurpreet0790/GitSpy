//
//  ProfileStateView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-07.
//

import SwiftUI

struct ProfileStateView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel : UserViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            switch viewModel.isFetching {
            case .notStarted:
                EmptyView()
                Spacer()
                    .frame(maxHeight: .infinity)
                
            case .fetching:
                ProgressView(Constants.loading)
                    .progressViewStyle()
                
            case .success:
                if let user = viewModel.userDetails {
                    ProfileContentView(user: user, isInteractive: true)
                        .padding()
                } else {
                    NoUserAvailableView()
                        .padding()
                }
                
            case .failed:
                NoUserAvailableView()
                    .padding()
            }
        }
    }
}

// MARK: - Preview
#Preview {
    //ProfileStateView()
}

