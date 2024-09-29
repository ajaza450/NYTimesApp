//
//  ContentView.swift
//  NYTimeApp
//
//  Created by EZAZ AHAMD on 26/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var articalsViewModel = MostPopularArticlesViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(articalsViewModel.articles,id: \.id) { artical in
                    NavigationLink {
                        ArticleDetailView(article: artical)
                    } label: {
                        ArticleRow(article: artical)
                    }
                }
            }
            .listStyle(.plain)
            .onAppear {
                // call Api
                Task {
                   await articalsViewModel.fetchArtical()
                }
            }
            .alert(isPresented: $articalsViewModel.hasError,
                   error: articalsViewModel.error) {
                Button("Retry") {
                    Task {
                        await articalsViewModel.fetchArtical()
                    }
                }
                
                Button("Cancel") {}
                
            }
            .toolbar{
                
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "line.horizontal.3")
                        .foregroundStyle(.white)
                }
            
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.white)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image("more")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                }
            }
            .navigationTitle("NY Times Most Popular")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
