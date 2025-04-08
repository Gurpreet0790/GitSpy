//
//  SearchBarView.swift
//  GitSpy
//
//  Created by ReetDhillon on 2025-04-07.
//

import SwiftUI

struct SearchBarView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel : UserViewModel
    
    // MARK: - Body
    var body: some View {
        HStack {
            HStack {
                Image(systemName: Constants.searchImage)
                    .iconStyle()
                
                TextField(Constants.searchPlaceholder, text: $viewModel.searchText)
                    .textFieldStyle(foregroundColor: .white, disableAutocorrection: true)
                    .onTapGesture {
                        withAnimation {
                           // viewModel.toggleEditing()
                        }
                    }
            }
            .searchViewStyle()
            .animation(.easeInOut, value: viewModel.searchText)
        }
        .padding(.horizontal)
    }
}

    
#Preview {
//    SearchBarView(text: $searchText)
}
