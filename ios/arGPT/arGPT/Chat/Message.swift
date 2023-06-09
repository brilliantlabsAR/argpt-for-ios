//
//  Message.swift
//  arGPT
//
//  Created by Bart Trzynadlowski on 5/1/23.
//

import Foundation

struct Message: Hashable {
    public var content: String
    public var typingInProgress = false // if true, content may be ignored and typing indicator will be shown
    public var isError = false          // if true, content must be printed and contains an error message
    public var participant: Participant

    private let _instanceID = UUID()

    /// Returns true if message instances are the same. Does not compare contents.
    public static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs._instanceID == rhs._instanceID
    }

    /// Hashes messages using their internal unique instance identifier
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_instanceID)
    }
}
