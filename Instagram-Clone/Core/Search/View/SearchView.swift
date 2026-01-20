//
//  SearchView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var viewModel = SearchViewModel(service: UserService())

    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                AvatarView(user: user, size: .small)
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                    }
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.bottom, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
                    .navigationBarBackButtonHidden()
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TabView {
        SearchView(viewModel: SearchViewModel(service: UserServiceMock()))
            .tabItem {
                Image(systemName: "magnifyingglass")
            }
    }
    .accentColor(.black)
}
