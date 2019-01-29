//
//  SlackBot.swift
//  SlackBot
//
//  Created by junwoo on 29/01/2019.
//  Copyright © 2019 samchon. All rights reserved.
//

import Foundation
import SlackKit

class SlackBot {
  
  let bot: SlackKit
  
  init(token: String) {
    
    bot = SlackKit()
    bot.addRTMBotWithAPIToken(token)
    bot.addWebAPIAccessWithToken(token)
    bot.notificationForEvent(.message) { [weak self] (event, client) in
      guard let message = event.message else { return }
      guard let self = self else { return }
      self.handleMessage(message)
    }
  }
  
  private func handleMessage(_ message: Message) {
    if let text = message.text,
      let channel = message.channel,
      text.contains("삼촌") {
      let reaction = "사랑해요"
      bot.webAPI?.sendMessage(channel: channel, text: reaction, success: nil, failure: nil)
    }
  }
}
