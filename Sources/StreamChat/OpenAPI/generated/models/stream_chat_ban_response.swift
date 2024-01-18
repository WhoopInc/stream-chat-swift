//
// Copyright © 2024 Stream.io Inc. All rights reserved.
//

import Foundation

public struct StreamChatBanResponse: Codable, Hashable {
    public var shadow: Bool?
    
    public var user: StreamChatUserObject?
    
    public var bannedBy: StreamChatUserObject?
    
    public var channel: StreamChatChannelResponse?
    
    public var createdAt: Date
    
    public var expires: Date?
    
    public var reason: String?
    
    public init(shadow: Bool?, user: StreamChatUserObject?, bannedBy: StreamChatUserObject?, channel: StreamChatChannelResponse?, createdAt: Date, expires: Date?, reason: String?) {
        self.shadow = shadow
        
        self.user = user
        
        self.bannedBy = bannedBy
        
        self.channel = channel
        
        self.createdAt = createdAt
        
        self.expires = expires
        
        self.reason = reason
    }
    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case shadow
        
        case user
        
        case bannedBy = "banned_by"
        
        case channel
        
        case createdAt = "created_at"
        
        case expires
        
        case reason
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(shadow, forKey: .shadow)
        
        try container.encode(user, forKey: .user)
        
        try container.encode(bannedBy, forKey: .bannedBy)
        
        try container.encode(channel, forKey: .channel)
        
        try container.encode(createdAt, forKey: .createdAt)
        
        try container.encode(expires, forKey: .expires)
        
        try container.encode(reason, forKey: .reason)
    }
}
