//
//  ImagesModel.swift
//  QuestionApp1
//
//  Created by 山岡巧 on 2020/09/17.
//  Copyright © 2020 takumi.yamaoka. All rights reserved.
//

import Foundation

class ImagesModel {
    
    // 画像名を取得して、その画像名が人間かそうでないかをフラグによって判定するための機能
    let imageText: String
    let answer: Bool
    
    init(imageName: String, correctOrNot: Bool){
        imageText = imageName
        answer = correctOrNot
    }
}
