//
//  PopUpView.swift
//  Pods-PopUpViewAlert_Example
//
//  Created by Daniel Coimbra on 21/08/17.
//


import UIKit

enum AnimationStatus{
	case isShowing,isNotShowing
}
enum waitingStatus{
	case waiting, notWaiting, canDisappear
}
open class View: UIView {
	
	fileprivate var textLable:     UITextView?
	fileprivate var titleLable: UITextView?
	fileprivate var image:        UIImageView?
	fileprivate var seconds:    Double!
	
	fileprivate var statusAnimation: AnimationStatus = .isNotShowing
	fileprivate var waitingStatus: waitingStatus = .notWaiting
	fileprivate var status = true
	fileprivate var origemY:    CGFloat = 0
	
	static let dimensions = UIScreen.main.bounds.size
	
	var frameHeight: CGFloat = 0 {
		willSet (val){
			textLable?.frame.size.height = val
			frame.size.height = val
		}
	}
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	convenience public init(origem originY : CGFloat, type: PopUpOptions, title: String) {
		self.init(frame: CGRect(origin: .zero, size: CGSize(width: View.dimensions.width, height: 0)))
		origemY = originY
		
		
		textLable = UITextView (frame: CGRect(x: View.dimensions.width * 0.3 , y: 0, width: (View.dimensions.width * 0.7) - 16, height: 100))
		textLable?.textColor = .white
		textLable?.textAlignment = NSTextAlignment.justified
		textLable?.backgroundColor = .clear
		textLable?.isUserInteractionEnabled = false
		
		image = UIImageView(frame: CGRect(x: 0, y: 16, width: (textLable?.frame.height)! - 16 * 2, height:(textLable?.frame.height)! - 16 * 2))
		image?.center.x = ((frame.width)/3)/2
		image?.frame.size.width = (image?.frame.height)!
		image?.contentMode = .scaleToFill
		
		self.frame.origin.y = -frameHeight
		
		addSubview(image!)
		addSubview(textLable!)
	}
	
	func handleTextChange(description text: String) {
		textLable?.font = UIFont(name: "Eurosoft-SemiboldItalic" , size: 0)
		
		textLable?.text = text
		
		textLable?.font = UIFont(name: "Eurosoft-SemiboldItalic" , size: textLable!.optimalHeight < 100 ? 20 : 16)
		
		if textLable!.optimalHeight <= 40{
			textLable?.frame.origin.y = 25
		} else if textLable!.optimalHeight > 40 && textLable!.optimalHeight <= 70 {
			textLable?.frame.origin.y = 15
		}else if textLable!.optimalHeight > 70 && textLable!.optimalHeight <= 100 {
			textLable?.frame.origin.y = 10
		}else if textLable!.optimalHeight > 100 && textLable!.optimalHeight <= 120 {
			textLable?.font = UIFont(name: "Eurosoft-SemiboldItalic" , size: 16)
			textLable?.frame.origin.y = 10
		}else{
			textLable?.font = UIFont(name: "Eurosoft-SemiboldItalic" , size: 16)
			textLable?.frame.origin.y = 0
		}
		frameHeight = textLable!.optimalHeight > 100 ? textLable!.optimalHeight : 100
	}
	
	open func handleOptionChange(_ tipo: PopUpOptions, _ text: String,seconds: Double) {
		if statusAnimation == .isShowing && textLable?.text != text {
			self.toggleStatus()
		}
		self.seconds = seconds
		image?.image = tipo.type
		backgroundColor = tipo.colorBackground
		self.handleTextChange(description: text)
		self.toggleStatus()
	}
	
	func setup() {
		addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleClick)))
		
		let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeUp.direction = UISwipeGestureRecognizerDirection.up
		self.addGestureRecognizer(swipeUp)
		
		self.clipsToBounds = true
		alpha = 0
		layer.zPosition = 1
	}
	
	@objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
		self.handleClick()
	}
	
	@objc func handleClick() {
		self.toggleStatus()
	}
	
	@objc open func toggleStatus() {
		defer {
			status = !status
		}
		if self.status{
			self.alpha = 1
		}else{
			NSObject.cancelPreviousPerformRequests(withTarget: self)
		}
		UIView.animate(withDuration: 0.5, animations: {
			
			self.frame.origin.y = (self.status ? self.origemY : -self.frameHeight)
			self.alpha = self.status ? 1 : 0
			self.statusAnimation = self.status ? .isShowing : .isNotShowing
			self.waitingStatus = self.status ? .waiting : .notWaiting
			
		}) { (finished:Bool) in
			if self.statusAnimation == .isShowing && self.waitingStatus == .waiting{
				self.perform(#selector(self.toggleStatus), with: nil, afterDelay: self.seconds)
			}
		}
	}
	
}
