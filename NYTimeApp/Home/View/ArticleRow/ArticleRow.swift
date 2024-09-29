//
//  ArticleRow.swift
//  NYTimeApp
//
//  Created by EZAZ AHAMD on 26/09/24.
//

import SwiftUI

struct ArticleRow: View {
    let article: Article
    
    var body: some View {
        HStack(spacing: 15.0) {
            ShowImage()
            VStack(alignment: .leading, spacing: 10.0) {
                titleView
                bylineView
                HStack {
                    sectionView
                    Spacer()
                    publishedView
                }
            }
        }
        .padding()
    }
}


extension ArticleRow {
    
    // MARK: - Image
    @ViewBuilder
     func ShowImage()-> some View {
        // Display first image if available
        if let media = article.media?.first,
           let imageUrl = media.media_metadata?.first?.url {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            } placeholder: {
                ProgressView()
            }
        } else {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
        }
    }
    
    // MARK: - titleView

    private var titleView : some View {
        Text(article.title ?? "")
            .font(.system(size: 18))
            .bold()
            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
    }
    
    // MARK: - Author View

    private var bylineView : some View {
        Text(article.byline ?? "")
            .font(.system(size: 17))
            .foregroundStyle(Color.gray)
    }
    
    // MARK: - SectionView

    private var sectionView : some View {
        Text(article.section ?? "")
            .font(.system(size: 16))
            .foregroundStyle(Color.gray)
    }
    
    // MARK: - Published Date View

    private var publishedView : some View {
        HStack {
            Image(systemName: "calendar")
                .foregroundStyle(.gray)
            Text(article.published_date ?? "2024-09-20")
                .font(.system(size: 16))
                .foregroundStyle(Color.gray)
        }
    }
}





#Preview {
    var previewArticle: Article {
        // Decoding JSON to get a sample Article instance for preview
        let res = try! StaticJSONMapper.decode(file: "Allsections", type: Json4Swift_Base.self)
        return (res.results?.first)! // Provide a fallback in case of nil
    }

    // Return the ArticleRow view so that it can be previewed
    return ArticleRow(article: previewArticle)
}

