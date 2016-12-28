//
//  SpeechSynthesizerDemo.swift
//  IOSDemos
//
//  Created by 金飞 on 28/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit
import AVFoundation

class SpeechSynthesizerDemoView: UIView {

    var _delegate: SpeechSynthesizerDemoViewDelegate!
    
    var _sythesizer: AVSpeechSynthesizer!
    var _voice: AVSpeechSynthesisVoice!
    
    let txtSentence: UITextView = UITextView()
    
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
        btnBack.addTarget(self, action: #selector(SpeechSynthesizerDemoView.btnBackPressed(btnObj:)), for: UIControlEvents.touchUpInside)
        
        let ktxtSentenceW: CGFloat = UIScreen.main.bounds.width
        let ktxtSentenceH: CGFloat = ktxtSentenceW * 0.8
        let ktxtSentenceX: CGFloat = 0
        let ktxtSentenceY: CGFloat = UIScreen.main.bounds.height * 0.15
        
        txtSentence.frame = CGRect(x: ktxtSentenceX, y: ktxtSentenceY, width: ktxtSentenceW, height: ktxtSentenceH)
        txtSentence.text = "测试"
        self.addSubview(txtSentence)
        
        
        let kbtnPlayW: CGFloat = 36
        let kbtnPlayH: CGFloat = kbtnPlayW
        let kbtnPlayX: CGFloat = (UIScreen.main.bounds.width - kbtnPlayW) / 2
        let kbtnPlayY: CGFloat = ktxtSentenceY + ktxtSentenceH + kbtnPlayW
        let btnPlay: UIButton = UIButton()
        btnPlay.frame = CGRect(x: kbtnPlayX, y: kbtnPlayY, width: kbtnPlayW, height: kbtnPlayH)
        btnPlay.setImage(#imageLiteral(resourceName: "btnPlay"), for: UIControlState.normal)
        btnPlay.addTarget(self, action: #selector(SpeechSynthesizerDemoView.btnPlay(btnObj:)), for: UIControlEvents.touchUpInside)
        self.addSubview(btnPlay)

        
        self._sythesizer = AVSpeechSynthesizer()
        self._voice = AVSpeechSynthesisVoice(language: "zh_CN")
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnPlay(btnObj: UIButton){
        let utterance: AVSpeechUtterance = AVSpeechUtterance(string: self.txtSentence.text!)
        utterance.voice = self._voice
        utterance.rate = 0.3
        self._sythesizer.speak(utterance)
    }
    
    func btnBackPressed(btnObj: UIButton){
        self._delegate.btnBackPressed(btnObj: btnObj)
    }

}
