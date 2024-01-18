//
// Copyright © 2024 Stream.io Inc. All rights reserved.
//

import Foundation

public struct StreamChatNotificationNewMessageEvent: Codable, Hashable, Event {
    public var channelId: String
    
    public var channelType: String
    
    public var cid: String
    
    public var createdAt: Date
    
    public var message: StreamChatMessage
    
    public var team: String?
    
    public var type: String
    
    public var channel: StreamChatChannelResponse?
    
    public init(channelId: String, channelType: String, cid: String, createdAt: Date, message: StreamChatMessage, team: String?, type: String, channel: StreamChatChannelResponse?) {
        self.channelId = channelId
        
        self.channelType = channelType
        
        self.cid = cid
        
        self.createdAt = createdAt
        
        self.message = message
        
        self.team = team
        
        self.type = type
        
        self.channel = channel
    }
    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case channelId = "channel_id"
        
        case channelType = "channel_type"
        
        case cid
        
        case createdAt = "created_at"
        
        case message
        
        case team
        
        case type
        
        case channel
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(channelId, forKey: .channelId)
        
        try container.encode(channelType, forKey: .channelType)
        
        try container.encode(cid, forKey: .cid)
        
        try container.encode(createdAt, forKey: .createdAt)
        
        try container.encode(message, forKey: .message)
        
        try container.encode(team, forKey: .team)
        
        try container.encode(type, forKey: .type)
        
        try container.encode(channel, forKey: .channel)
    }
}
