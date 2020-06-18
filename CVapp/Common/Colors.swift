import UIKit

public struct Colors {
	public static let background: UIColor = color(named: "background")
	public static let lightGray: UIColor = color(named: "lightGray")
	public static let mainText: UIColor = color(named: "mainText")
	public static let subHeader: UIColor = color(named: "subeheader")
	
	static func color(named: String) -> UIColor {
		if let color = UIColor(named: named) {
			return color
		} else {
			print(" --- Cannot find color named \(named)")
			return .cyan
		}
	}
}
