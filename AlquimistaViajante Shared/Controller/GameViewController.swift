//
//  GameViewController.swift
//  AlquimistaViajante
//
//  Created by Anna Carolina Costa Andrade on 14/03/22.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
#if os(iOS)
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
#endif
    var maisFraco = false
    var time = Timer()
    
    var scene: SKScene = GameSceneLaboratory()
    let skView = SKView()
    var GC = GameController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GC.changeDelegate = self
        ManagerGameCenter.authenticateUser(from: self)
#if os(iOS)
        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission { allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.startRecording()
                        self.loadScene()
                                                
                    } else {
                        print("erro ao tentar gravar")
                    }
                }
            }
        } catch {
            print("erro ao tentar gravar")
        }
            
        self.becomeFirstResponder()
#else
        self.loadScene()
#endif
        
    }
    
    func loadScene() {
        scene.scaleMode = .aspectFit
        scene.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        skView.presentScene(scene)
        skView.ignoresSiblingOrder = true
        self.view = skView
        
    }
#if os(iOS)
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            guard let sceneRect = scene as? GameSceneReaction else { return }
            sceneRect.shake()
        }
    }
#endif
}
#if os(iOS)
extension GameViewController: AVAudioRecorderDelegate {
    class func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

    class func getWhistleURL() -> URL {
        return getDocumentsDirectory().appendingPathComponent("whistle.m4a")
    }
    
    func startRecording() {

        // 3
        let audioURL = GameViewController.getWhistleURL()
        print(audioURL.absoluteString)

        // 4
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            // 5
            audioRecorder = try AVAudioRecorder(url: audioURL, settings: settings)
            audioRecorder.isMeteringEnabled = true
            audioRecorder.delegate = self
            audioRecorder.record()
            time = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(measureIntensity), userInfo: nil, repeats: true)
        } catch {
            finishRecording(success: false)
        }
    }
    
    func finishRecording(success: Bool) {
        
        time.invalidate()
        audioRecorder.stop()
        audioRecorder = nil

        if success {
            print("sucesso")
        } else {
            let ac = UIAlertController(title: "Record failed", message: "There was a problem recording your whistle; please try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
   @objc func measureIntensity() -> Float {
        guard let sceneBreak = scene as? GameSceneBreakChemicalBond else { return 0 }
        var decibel = audioRecorder.peakPower(forChannel: 0)
        audioRecorder.updateMeters()
        let minDb: Float = -80
            
            // 2
        if decibel < minDb {
            decibel = 0.0
        } else if decibel >= 1.0 {
            decibel -= minDb
        } else {
              // 3
            decibel -= minDb
        }
       if maisFraco {
           if decibel>=75 {
               sceneBreak.assobrar()
           }
       } else {
           if decibel>=79 {
               sceneBreak.assobrar()
           }
       }
            
        return decibel
    }
    
    func showGameLeaderBoard() {
        ManagerGameCenter.setHighScore(score: GC.points)
        if (!ManagerGameCenter().toSpecificPage(from: self, to: .leaderboards)) {
                    print("Not connected")
                }
    }
}

#endif
extension GameViewController: ChangeSceneDelegate {
    func changeScene(scene: SKScene) {
        self.scene.removeAllChildren()
        self.scene = scene
        loadScene()
        
        #if os(tvOS)
        scene.run(SKAction.wait(forDuration: 0.02)) {
        scene.view?.window?.rootViewController?.setNeedsFocusUpdate()
        scene.view?.window?.rootViewController?.updateFocusIfNeeded()

        }
        #endif
    }
}
#if os(tvOS)
extension GameViewController {

    override var preferredFocusEnvironments: [UIFocusEnvironment] {
         if let scene = (view as? SKView)?.scene {
             return [scene]
         }
         return []
    }
}
#endif
