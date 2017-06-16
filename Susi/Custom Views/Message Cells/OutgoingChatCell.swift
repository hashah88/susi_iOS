//
//  OutgoingChatCell.swift
//  Susi
//
//  Created by Chashmeet Singh on 2017-06-04.
//  Copyright © 2017 FOSSAsia. All rights reserved.
//

import UIKit
import SwiftDate

class OutgoingChatCell: ChatMessageCell {

    var message: Message? {
        didSet {
            messageTextView.text = message?.message
        }
    }

    override func setupViews() {
        super.setupViews()

        self.bubbleImageView.image = ChatMessageCell.blueBubbleImage
    }

    func setupDate() {
        let date = DateInRegion(absoluteDate: message?.queryDate as Date!)
        let str = date.string(format: .custom("HH:mm a"))
        timeLabel.text = str
        textBubbleView.addSubview(timeLabel)
        textBubbleView.addConstraintsWithFormat(format: "H:[v0]-23-|", views: timeLabel)
        textBubbleView.addConstraintsWithFormat(format: "V:[v0]-4-|", views: timeLabel)
    }

    func setupCell(_ estimatedFrame: CGRect, _ viewFrame: CGRect) {
        self.messageTextView.frame = CGRect(x: viewFrame.width - estimatedFrame.width - 32, y: 0, width:estimatedFrame.width + 16, height: estimatedFrame.height + 20)
        self.textBubbleView.frame = CGRect(x: viewFrame.width - estimatedFrame.width - 40, y: -4, width: estimatedFrame.width + 34, height: estimatedFrame.height + 26)

        self.bubbleImageView.tintColor = UIColor.incomingMessageTintColor()
        self.messageTextView.textColor = .black
        self.setupDate()
    }

}