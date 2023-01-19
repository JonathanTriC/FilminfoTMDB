//
//  HomeView.swift
//  Filminfo
//
//  Created by JonathanTriC on 18/01/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    if !viewModel.rows.isEmpty {
                        ForEach(viewModel.rows) { row in
                            HomeMovieList(title: row.title, results: row.list.results, endpoint: row.endpoint, params: row.parameters)
                        }
                    } else {
                        ProgressView()
                            .frame(alignment: .center)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
            .navigationTitle("Filminfo")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


