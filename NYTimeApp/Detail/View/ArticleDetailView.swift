//
//  ArticleDetailView.swift
//  NYTimeApp
//
//  Created by EZAZ AHAMD on 27/09/24.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article

    
    var body: some View {
        ScrollView  {
            VStack(alignment: .leading, spacing: 16) {
                showimage()
                titleView
                bylineView
                publishedView
                abstractView
                linkView
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Article Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}



extension ArticleDetailView {
    // MARK: - Show image

    @ViewBuilder
    func showimage()-> some View {
       // Display first image if available
       if let media = article.media?.first,let imageUrl = media.media_metadata?.last?.url {
           AsyncImage(url: .init(string: imageUrl)) { image in
               image
                   .resizable()
                   .aspectRatio(contentMode: .fit)
           } placeholder: {
               ProgressView()
           }
       }
   }
    
    // MARK: - Title View

    
    private var titleView : some View {
        Text(article.title ?? "")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.top)
    }
    
    // MARK: - Author View

    private var bylineView : some View {
        Text(article.byline ?? "")
            .font(.headline)
            .foregroundStyle(.secondary)
    }
  
    // MARK: - SectionView

    private var sectionView : some View {
        Text(article.section ?? "")
            .font(.system(size: 16))
            .foregroundStyle(Color.gray)
    }
    
    // MARK: - Published Date View

    private var publishedView : some View {
        Text("Published on \(article.published_date ?? "")")
            .font(.subheadline)
            .foregroundColor(.gray)
    }
    
    // MARK: - Abstract
    
    private var abstractView : some View {
        Text(article.abstract ?? "")
            .font(.body)
    }
    
    // MARK: - Link View
    
    @ViewBuilder
    private var linkView : some View {
        // Link to full article
        if let url = URL(string: article.url ?? "") {
            Link("Read Full Article", destination: url)
                .font(.headline)
                .foregroundStyle(.blue)
                .padding(.top,16)
        }
    }
    
    
}






#Preview {
    var previewArticle: Article {
        // Decoding JSON to get a sample Article instance for preview
        let res = try! StaticJSONMapper.decode(file: "Allsections", type: Json4Swift_Base.self)
        return (res.results?.first)! // Provide a fallback in case of nil
    }

    
    return  ArticleDetailView(article: previewArticle)
}
