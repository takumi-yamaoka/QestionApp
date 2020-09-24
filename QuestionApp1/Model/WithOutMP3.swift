//
//  WithOutMP3.swift
//  QuestionApp1
//
//  Created by 山岡巧 on 2020/09/21.
//  Copyright © 2020 takumi.yamaoka. All rights reserved.
//

import Foundation

class WithOutMP3: SoundFile {
    override func playSound(fileName: String, extensionName: String) {
        if extensionName == "mp3" {
            print("このファイルは再生できません")
        }
        player?.stop()
    }
}
