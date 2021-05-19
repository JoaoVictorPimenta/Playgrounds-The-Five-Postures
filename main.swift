/*:
 Hello! My name is João Pimenta! I'm from Brazil, and I'm here to introduce my love: The Kung Fu - Choy Lay Fut! Hope you enjoy it! Special Thanks to Hung Sing Kung Fu Academy Brazil, the place were I practice Kung fu.
 */
//#-hidden-code
import UIKit
import PlaygroundSupport
import AVFoundation

class MyViewController: UIViewController, AVAudioPlayerDelegate{
    var backgroundImg = UIImageView()
    var label = UILabel()
    var button: UIButton!
    var screenNumber: Int = 0
    var pergaminhoImageView = UIImageView(frame: .zero)
    var vectorExplication: [String] = ["Hey, everyone! My name is João Pimenta, student of Kung Fu! Let's learn about Kung Fu, \nmore specifically of the 5 animals of the Choy Lay Fut style and their postures!\nFirst of all, Kin Lai!\nThis is our way of greeting each other, closing the right hand and covering it with the left,\nrepresenting respect and balance.The combat techniques developed were inspired by animals through study and observation!\nClick on the image to continue.","\n\nThe first animal to be introduced is the Tiger.\nWhen we remember the tiger, it is practically instantaneous to relate it with strength and cautious movements.\nThe tiger's claw is a palm stroke that can scratch and/or grab your opponent.\n About the technique, the representations are aggressiveness, determination and greed.","Now it's Panther time! There is no way to talk about Panther without thinking about agility and speed. In Kung Fu, the Panther represents speed.\nThrough the Panther, we have the Chop Choi blow (panther's fist), made with the fingers flexed from the second joint.\n This technique resembles a cat's paw. To improve Chop Choi, it is necessary to strengthen the joints and agility.","In Kung Fu, the Crane has movements of elegance and harmony. \nUnlike the Panther and the Tiger, the Crane is not an attack animal.\nCombat strategies are based on defense, blocking, dodging and redirecting attacks, reaching the \nmain highlight, the counterattack. They seem easy to be performed,\nbut require high concentration and precision from those who perform it. \nAfter all, the best attack is an excellent defense.","We talked abou the  Tiger, Panther and the Crane. Now is the momento for the Serpent, knowned for being alert in its hunting moments.\nTherefore, in Kung Fu, flexibility and fluidity are perfect words to describe it.\nHand techniques are aimed at reaching specific and precise points, working on the notion of distance and vision.","In Chinese mythology, the Dragon represents \none of the four divine animals that possess great wisdom and powers considered supernatural.\nIn techniques, the Dragon manifests itself through various attacks, which penetrate the opponent.\nSome of the strokes of this animal are So Geuk (Low Kicks) or Look Q (Dragon's claw).\n These were the 5 animals of Choy Lay Fut! Thanks for your time, Kin Lai!"]
    
    var vectorImages:[String] = ["kinlai.png","tigre.png","pantera.png","garca.png","serpente.png","dragao.png"]
    
    var backgroundSound: AVAudioPlayer?
    
    override func viewDidLoad() {
        //let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.002153213368728757, green: 0.7407835125923157, blue: 0.9958527684211731, alpha: 1.0)
        //colocando uma imagem de fundo:
        backgroundImg.image = UIImage(named: "CoresFundoBg.png")
        backgroundImg.contentMode = .scaleToFill
        self.view.addSubview(backgroundImg)
        
        backgroundImg.translatesAutoresizingMaskIntoConstraints = false
        backgroundImg.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImg.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImg.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImg.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //atualizando o pergaminho
        pergaminhoImageView.image = UIImage(named: "Pergaminho.png")
        pergaminhoImageView.contentMode = .scaleToFill
        pergaminhoImageView.layer.masksToBounds = true
        view.addSubview(pergaminhoImageView)
        
        pergaminhoImageView.translatesAutoresizingMaskIntoConstraints = false
        pergaminhoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pergaminhoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        //label.preferredMaxLayoutWidth = 550
        pergaminhoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        pergaminhoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        
        
        
        label.font = UIFont(name: "Papyrus", size: 15)
        
        //adicionando o Pergaminho
        label.frame = .zero
        
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        pergaminhoImageView.addSubview(label)
        //view.addSubview(label)
        //label.translatesAutoresizingMaskIntoConstraints = false
        //label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //label.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        
        button = UIButton(type: .custom)
        button.addTarget(self,action: #selector(all), for: .touchUpInside)
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5).isActive = true
        
        screenOrganization(screenNum: 0)
        loopMusic()
    }
    
    func loopMusic(){
        backgroundSound?.delegate = self
        let path = Bundle.main.path(forResource: "JohnBartmannCherryBlossom.mp3", ofType:nil)!
        //Music by John Bartmann - Cherry Blossom
        let url = URL(fileURLWithPath: path)
        do {
            backgroundSound = try AVAudioPlayer(contentsOf: url)
            backgroundSound?.play()
            backgroundSound?.numberOfLoops = -1
        }catch{
            print("Something is wrong with audio")
        }
    }
    func screenOrganization (screenNum: Int){
        button.setImage(UIImage(named: vectorImages[screenNum]), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        label.text = vectorExplication[screenNum]
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: pergaminhoImageView.centerXAnchor).isActive = true
        //label.topAnchor.constraint(equalTo: pergaminhoImageView.topAnchor, constant: 50).isActive = true
        //label.preferredMaxLayoutWidth = 550
        label.centerYAnchor.constraint(equalTo: pergaminhoImageView.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: pergaminhoImageView.widthAnchor, multiplier: 0.8).isActive = true
        label.heightAnchor.constraint(equalTo: pergaminhoImageView.heightAnchor, multiplier: 0.4).isActive = true
    }
    @objc func all() {
        if screenNumber == 5 {
            screenNumber = 0
            screenOrganization(screenNum: screenNumber)
        }
        else {
            screenNumber += 1
            screenOrganization(screenNum: screenNumber)
        }
    }
    
}
PlaygroundPage.current.liveView = MyViewController()

//#-end-hidden-code
