//
//  ViewController.swift
//  Demo
//
//  Created by Lee on 2019/10/19.
//

import UIKit
import Extensions

class ImageExtensionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func reset() {
        imageView.contentMode = .scaleAspectFit
    }
}

extension ImageExtensionViewController {
    
    @IBAction func resetAction(_ sender: Any) {
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "image")
    }
    
    @IBAction func initAction(_ sender: UITapGestureRecognizer) {
        reset()
        let index = sender.view?.subviewIndex(tap: sender)
        switch index {
        case 0:
            imageView.image = #imageLiteral(resourceName: "logo").byResize(to: .init(300, 168), contentMode: .center)
            
        case 1:
            imageView.contentMode = .center
            imageView.image = UIImage(emoji: "🐼", size: 80)
            
        case 2:
            imageView.contentMode = .scaleAspectFill
            imageView.image = UIImage.init(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
            
        default:
            break
        }
    }
    
    @IBAction func rotateAction(_ sender: UITapGestureRecognizer) {
        reset()
        
        let index = sender.view?.subviewIndex(tap: sender)
        switch index {
        case 0:         imageView.image = #imageLiteral(resourceName: "image").byRotate(with: .init(value: 60, unit: .degrees))
        case 1:         imageView.image = #imageLiteral(resourceName: "image").byRotate(with: .init(value: 90, unit: .degrees))
        case 2:         imageView.image = #imageLiteral(resourceName: "image").byRotate(with: .init(value: 120, unit: .degrees))
        default:
            break
        }
    }
    
    @IBAction func flipAction(_ sender: UITapGestureRecognizer) {
        imageView.contentMode = .center
        
        let index = sender.view?.subviewIndex(tap: sender)
        switch index {
        case 0:          imageView.image = #imageLiteral(resourceName: "logo").byFlip(.horizontal)
        case 1:          imageView.image = #imageLiteral(resourceName: "logo").byFlip(.vertical)
        case 2:          imageView.image = #imageLiteral(resourceName: "logo").byFlip([.horizontal, .vertical])
        default:
            break
        }
    }
    
    @IBAction func resizeAction(_ sender: UITapGestureRecognizer) {
        reset()
        
        let index = sender.view?.subviewIndex(tap: sender)
        switch index {
        case 0:          imageView.image = #imageLiteral(resourceName: "logo").byResize(to: .init(300, 168), contentMode: .topLeft)
        case 1:          imageView.image = #imageLiteral(resourceName: "logo").byResize(to: .init(300, 168), contentMode: .bottomRight)
        case 2:          imageView.image = #imageLiteral(resourceName: "logo").byResize(to: .init(300, 168), contentMode: .left)
        case 3:          imageView.image = #imageLiteral(resourceName: "logo").byResize(to: .init(300, 168), contentMode: .right)
        case 4:          imageView.image = #imageLiteral(resourceName: "logo").byResize(to: .init(300, 168), contentMode: .center)
        default:
            break
        }
    }
    
    @IBAction func otherAction(_ sender: UITapGestureRecognizer) {
        reset()
        
        let index = sender.view?.subviewIndex(tap: sender)
        switch index {
        case 0:         imageView.image = #imageLiteral(resourceName: "image").byCrop(to: .init(0, 0, 200, 100))
        case 1:         imageView.image = #imageLiteral(resourceName: "image").byInsetEdge(to: .init(20, 40, 50, 5), with: .blue)
        case 2:         imageView.image = #imageLiteral(resourceName: "image").byRoundCornerRadius(to: .init(topLeft: 20, topRight: 30, bottomLeft: 50, bottomRight: 5), borderWidth: 5, borderColor: .blue, borderLineJoin: .round)
        case 3:
            imageView.contentMode = .center
            imageView.image = #imageLiteral(resourceName: "logo").byTintColor(to: .red)
            
        default:
            break
        }
    }
}

extension UIView {
    
    func subviewIndex(tap: UITapGestureRecognizer) -> Int? {
        let point = tap.location(in: self)
        return subviews.firstIndex { $0.frame.contains(point) }
    }
}
