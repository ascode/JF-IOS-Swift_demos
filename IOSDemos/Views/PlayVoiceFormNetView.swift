//
//  PlayVoiceFormNetView.swift
//  IOSDemos
//
//  Created by 金飞 on 28/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit
import AVFoundation

class PlayVoiceFormNetView: UIView, AVAudioPlayerDelegate {

    var _delegate: PlayVoiceFormNetViewDelegate!
    
    let urlTextInput: UITextField = UITextField()
    
    var player: AVAudioPlayer!//不要把 AVAudioPlayer 当做局部变量,在局部声明不会发出声音
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let kbtnBackW: CGFloat = 36
        let kbtnBackH: CGFloat = kbtnBackW
        let kbtnBackX: CGFloat = 15
        let kbtnBackY: CGFloat = 15
        let btnBack: UIButton = UIButton()
        btnBack.frame = CGRect(x: kbtnBackX, y: kbtnBackY, width: kbtnBackW, height: kbtnBackH)
        btnBack.setImage(#imageLiteral(resourceName: "btnBack"), for: UIControlState.normal)
        
        self.addSubview(btnBack)
        btnBack.addTarget(self, action: #selector(PlayVoiceFormNetView.btnBackPressed(btnObj:)), for: UIControlEvents.touchUpInside)
        
        
        let kurlTextInputW: CGFloat = UIScreen.main.bounds.width
        let kurlTextInputH: CGFloat = 26
        let kurlTextInputX: CGFloat = 0
        let kurlTextInputY: CGFloat = UIScreen.main.bounds.height * 0.2
        urlTextInput.frame = CGRect(x: kurlTextInputX, y: kurlTextInputY, width: kurlTextInputW, height: kurlTextInputH)
        //urlTextInput.text = "http://image.bgenius.cn/enjiafuture/voice/vocabulary_word_voice/100"
        urlTextInput.text = "http://image.bgenius.cn/enjiafuture/voice/stlc_content_voice/11255"
        urlTextInput.borderStyle = UITextBorderStyle.line
        self.addSubview(urlTextInput)
        
        
        let kbtnPlayW: CGFloat = 36
        let kbtnPlayH: CGFloat = kbtnPlayW
        let kbtnPlayX: CGFloat = (UIScreen.main.bounds.width - kbtnPlayW) / 2
        let kbtnPlayY: CGFloat = kurlTextInputY + kurlTextInputH + kbtnPlayW
        let btnPlay: UIButton = UIButton()
        btnPlay.frame = CGRect(x: kbtnPlayX, y: kbtnPlayY, width: kbtnPlayW, height: kbtnPlayH)
        btnPlay.setImage(#imageLiteral(resourceName: "btnPlay"), for: UIControlState.normal)
        btnPlay.addTarget(self, action: #selector(PlayVoiceFormNetView.btnPlayPressed(btnObj:)), for: UIControlEvents.touchUpInside)
        self.addSubview(btnPlay)
        
        
        let kbtnPlayLocalW: CGFloat = 280
        let kbtnPlayLocalH: CGFloat = 150
        let kbtnPlayLocalX: CGFloat = (UIScreen.main.bounds.width - kbtnPlayLocalW) / 2
        let kbtnPlayLocalY: CGFloat = kbtnPlayY + kbtnPlayH + kbtnPlayLocalW
        let btnPlayLocal: UIButton = UIButton()
        btnPlayLocal.frame = CGRect(x: kbtnPlayLocalX, y: kbtnPlayLocalY, width: kbtnPlayLocalW, height: kbtnPlayLocalH)
        btnPlayLocal.setImage(#imageLiteral(resourceName: "btnPlay"), for: UIControlState.normal)
        btnPlayLocal.setTitle("播放本地音乐", for: UIControlState.normal)
        btnPlayLocal.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnPlayLocal.addTarget(self, action: #selector(PlayVoiceFormNetView.btnPlayLocalPressed(btnObj:)), for: UIControlEvents.touchUpInside)
        self.addSubview(btnPlayLocal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("播放完毕")
    }
    
    func btnPlayPressed(btnObj: UIButton){
        
        let session:AVAudioSession = AVAudioSession.sharedInstance()
        
        do {
        
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: AVAudioSessionCategoryOptions.defaultToSpeaker)
            try session.setActive(true)
            
        }catch let err as NSError {
            print(err.localizedDescription)
        }
    
        
        let voiceUrl: URL = URL(string: self.urlTextInput.text!)!
        
        do {
            let voiceData: NSData! = NSData(contentsOf: voiceUrl)
            if let voice: NSData = voiceData {
                player = try AVAudioPlayer(data: voice as Data, fileTypeHint: "AVFileTypeMPEGLayer3")
                //            player = try AVAudioPlayer(contentsOf: voiceUrl)
                player.prepareToPlay()
                player.delegate = self
                player.play()
            }
        }catch let err as NSError {
            print(err.localizedDescription)
        }
        
        
        
    }
    
    func btnPlayLocalPressed(btnObj: UIButton){
        
        let session:AVAudioSession = AVAudioSession.sharedInstance()
        
        do {
            
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: AVAudioSessionCategoryOptions.defaultToSpeaker)
            try session.setActive(true)
            
        }catch let err as NSError {
            print(err.localizedDescription)
        }
        
        
        let voiceUrl: URL = URL(fileURLWithPath: Bundle.main.path(forResource: "anjiexigongzhu", ofType: "mp3")!)
        
        do {
            player = try AVAudioPlayer(contentsOf: voiceUrl)
            player.prepareToPlay()
            player.delegate = self
            player.play()
        }catch let err as NSError {
            print(err.localizedDescription)
        }
        
        
        
    }
    
    func btnBackPressed(btnObj: UIButton){
        self._delegate.btnBackPressed(btnObj: btnObj)
    }

}
