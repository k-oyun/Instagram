//
//  Post.swift
//  InstagramClone
//
//  Created by Admin on 8/19/25.
//

import Foundation


struct Post: Identifiable {
    let id = UUID()
    let userName: String
    let userImage: String
    let postImage: String
    let likeCount: Int
    let caption: String
    let timeAgo: String
}
