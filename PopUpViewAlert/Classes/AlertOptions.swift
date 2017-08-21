//
//  AlertOptions.swift
//  Pods-PopUpViewAlert_Example
//
//  Created by Daniel Coimbra on 21/08/17.
//


import UIKit

public enum PopUpOptions {
	case danger,sucess,error
	
	var type: UIImage {
		
		let frameworkBundle = Bundle(for: View.self)
		let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("PopUpViewAlert.bundle")
		
		switch self {
		case .danger:
			return UIImage(named: "danger.png", in: Bundle(url: bundleURL!), compatibleWith: nil)!
		case .sucess:
			return UIImage(named: "success.png", in: Bundle(url: bundleURL!), compatibleWith: nil)!
		case .error:
			return UIImage(named: "error.png", in: Bundle(url: bundleURL!), compatibleWith: nil)!
		}
	}
	
	var colorBackground: UIColor{
		switch self {
		case .danger:
			return UIColor(r: 255, g: 204, b: 0)
		case .error:
			return UIColor(r: 207, g: 0, b: 38)
		case .sucess:
			return UIColor(r: 119, g: 212, b: 53)
		}
	}
	
}


extension UIColor{
	
	convenience init(r: CGFloat, g: CGFloat ,b: CGFloat){
		self.init(red: r/255,green: g/255,blue: b/255 , alpha: 1)
	}
}


extension UITextView{
	var optimalHeight : CGFloat
	{
		get
		{
			let label = UITextView(frame: CGRect(x:0, y: 0,width: self.frame.width, height: CGFloat.greatestFiniteMagnitude))
			label.font = self.font
			label.text = self.text
			
			label.sizeToFit()
			
			return label.frame.height
		}
	}
}
