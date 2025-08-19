//
//  ContentView.swift
//  InstagramClone
//
//  Created by Admin on 8/19/25.
//

import SwiftUI

struct ContentView: View {
    let posts = [
        Post(userName: "송지은", userImage: "monkey", postImage: "monkey", likeCount: 30, caption: "셀카 어떰? 이쁘지" ,timeAgo: "방금전"),
        Post(userName: "곽태근", userImage: "surfing", postImage: "surfing", likeCount: 35, caption: "양양 다녀왔어요~" ,timeAgo: "방금전"),
        Post(userName: "추창우", userImage: "developer", postImage: "developer", likeCount: 10, caption: "난 언제든 가디다.." ,timeAgo: "12시간전")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack{
                    ForEach(posts) { post in
                        NavigationLink(
                            destination:PostDetailView(post:post)) {
                                FeedCardView(post: post)
                                    .padding(.bottom,10)
                            }
                        
                    }
                }
            }
            .background(Color.gray.opacity(0.1))
            .navigationTitle("Feed")
//            .navigationBarTitleDisplayMode(.)
        }
        .tint(.primary)
        
    }
}

struct FeedCardView: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 사용자 정보 영역
            HStack(alignment: .center, spacing: 8){
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width:50, height: 50)
                Text(post.userName)
                    .font(.subheadline)
                    .bold()
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal, 5)
            
            // 게시물 이미지
            Image(post.postImage)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
                .clipped()
                .background(Color.gray.opacity(0.2))
            
            // 버튼 영역
            HStack(alignment: .center, spacing: 8){
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 25, height: 23)
                Image(systemName: "bubble.right")
                    .resizable()
                    .frame(width: 25, height: 23)
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 25, height: 23)
                
                Spacer()
                
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: 20, height: 23)
                    .padding(.trailing, 10)
            }
            .padding(.leading, 10)
            
            // 좋아요, 캡션, 시간
            VStack(alignment: .leading, spacing: 4) {
                Text("좋아요 \(post.likeCount)개")
                    .fontWeight(.bold)
                Text(post.caption)
                    .font(.callout)
                Text(post.timeAgo)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            
        }
        .padding(.vertical, 5)
        .background(.white)
    }
}


struct PostDetailView: View {
    let post: Post
    var body: some View {
        VStack {
            Text(post.caption)
        }
        .background(Color.gray.opacity(0.1))
        .navigationTitle("Post Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
