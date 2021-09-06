//
//  ArticleView.swift
//  NewsApp
//
//  Created by KANISHK VIJAYWARGIYA on 06/09/21.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    let article: Article
    
    var body: some View {
        HStack {
            if let imageUrl = article.image,
               let url = URL(string: imageUrl) {
                URLImage(
                    url,
                    failure: {error, _ in
                        Image(systemName: "photo.fill")
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .frame(width: 100, height: 100)
                    }
                ) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            } else {
                placeHolderImage()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                
                Text(article.source ?? "")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

// placeholder image
@ViewBuilder
func placeHolderImage() -> some View {
    Image(systemName: "photo.fill")
        .foregroundColor(.white)
        .background(Color.gray)
        .frame(width: 100, height: 100)
        .border(Color.gray, width: 3)
        .cornerRadius(10)
}


struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
