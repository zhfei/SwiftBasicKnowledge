//
//  PlaySound.swift
//  FirstApp
//
//  Created by zhoufei on 2023/11/5.
//

import Foundation
import AVFoundation


var audioPlayer : AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer =  try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play();
        } catch  {
            print("不能播放指定的音效文件。");
            print(error);
        }
    }
}






