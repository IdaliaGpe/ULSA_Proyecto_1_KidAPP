//
//  ViewController.swift
//  Proyecto_1
//
//  Created by Alumno on 9/5/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //Varbles Audio
    var reproductorAudios : AVAudioPlayer?
    var reproductorMusica : AVAudioPlayer?
    var urlClover: URL?
    var urlSpades: URL?
    var urlDiamond: URL?
    var urlMusica: URL?
    
    //VariablesSecuencia
    var secuenciaSpades1 : [UIImage] = []
    var secuenciaSpades2 : [UIImage] = []
    
    var secuenciaClover1 : [UIImage] = []
    var secuenciaClover2 : [UIImage] = []
    
    var secuenciaDiamond1 : [UIImage] = []
    var secuenciaDiamond2 : [UIImage] = []
    
    //Variables Texto e Imagenes
    @IBOutlet weak var lblTextoChange: UILabel!
    
    @IBOutlet weak var imgSpades: UIImageView!
    @IBOutlet weak var imgClover: UIImageView!
    @IBOutlet weak var imgDiamond: UIImageView!
    @IBOutlet weak var imgPrincipal: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        //Musica
        do{
            let urlMusica = Bundle.main.url(forResource: "Fondomusic", withExtension: "mp3")
            reproductorMusica = try AVAudioPlayer(contentsOf: urlMusica!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductorMusica?.volume = 0.2
            reproductorMusica?.play()
        }catch let error {
            print(error.localizedDescription)
        }
        
        //URL Audio
        urlClover = Bundle.main.url(forResource: "Clover", withExtension: "mp3")
        
        urlSpades = Bundle.main.url(forResource: "Spades", withExtension: "mp3")
        
        urlDiamond = Bundle.main.url(forResource: "Diamond", withExtension: "mp3")
        
        //Secuencias
        for i in 1...24{
            let imagen = UIImage(named: "Pica\(i)")
            secuenciaSpades1.append(imagen!)
        }
        
        for i in 1...24{
            let imagen = UIImage(named: "Diamante\(i)")
            secuenciaDiamond1.append(imagen!)
        }
        
        for i in 1...24{
            let imagen = UIImage(named: "Trebol\(i)")
            secuenciaClover1.append(imagen!)
        }
        
        //Secuencia Imagen
        imgSpades.animationImages = secuenciaSpades1
        imgSpades.animationDuration = 1.0
        imgSpades.startAnimating()
        
        imgClover.animationImages = secuenciaClover1
        imgClover.animationDuration = 1.0
        imgClover.startAnimating()
        
        imgDiamond.animationImages = secuenciaDiamond1
        imgDiamond.animationDuration = 1.0
        imgDiamond.startAnimating()

    }
    
    @IBAction func doClover(_ sender: Any) {
        lblTextoChange.text = "Clover"
        
        //Sonido
        do{
            reproductorAudios = try AVAudioPlayer(contentsOf: urlClover!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductorAudios?.volume = 1
            reproductorAudios?.play()
        }catch let error {
            print(error.localizedDescription)
        }
        
        for i in 1...24{
            let imagen = UIImage(named: "xTrebol\(i)")
            secuenciaClover2.append(imagen!)
        }
        
        //Imagenes
        imgPrincipal.stopAnimating()
        imgPrincipal.animationImages = secuenciaClover2
        imgPrincipal.animationDuration = 1.0
        imgPrincipal.startAnimating()
    }
    
    @IBAction func doPica(_ sender: Any) {
        lblTextoChange.text = "Spades"
        
        //Sonido
        do{
            reproductorAudios = try AVAudioPlayer(contentsOf: urlSpades!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductorAudios?.play()
        }catch let error {
            print(error.localizedDescription)
        }
        
        for i in 1...24{
            let imagen = UIImage(named: "xPica\(i)")
            secuenciaSpades2.append(imagen!)
        }
        
        //Imagenes
        imgPrincipal.stopAnimating()
        imgPrincipal.animationImages = secuenciaSpades2
        imgPrincipal.animationDuration = 1.0
        imgPrincipal.startAnimating()
    }
    
    @IBAction func doDiamond(_ sender: Any) {
        lblTextoChange.text = "Diamond"
        
        do{
            reproductorAudios = try AVAudioPlayer(contentsOf: urlDiamond!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductorAudios?.play()
        }catch let error {
            print(error.localizedDescription)
        }
        
        for i in 1...24{
            let imagen = UIImage(named: "xDiamante\(i)")
            secuenciaDiamond2.append(imagen!)
        }
        
        //Imagenes
        imgPrincipal.stopAnimating()
        imgPrincipal.animationImages = secuenciaDiamond2
        imgPrincipal.animationDuration = 1.0
        imgPrincipal.startAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

