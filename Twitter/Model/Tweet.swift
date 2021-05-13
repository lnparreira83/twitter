//
//  Tweet.swift
//  Twitter
//
//  Created by Lucas Parreira on 3/05/21.
//

import Foundation

struct Tweet: Identifiable {
    let id = UUID()
    let authorName:String
    let authorUsername:String
    let timestampText:String
    let text:String
    let numberOfReplies:Int
    let numberOfRetweets:Int
    let numberOfLikes:Int
}
