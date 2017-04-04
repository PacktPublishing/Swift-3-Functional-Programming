//: [Previous](@previous)

import Foundation

protocol CustomView {
	associatedtype ViewType
	func configure(view with: ViewType)
}

struct Button {}

struct CustomEnabledButton: CustomView {
	typealias ViewType = Button
	func configure(view with: ViewType) {
		// configure the view
		print("Enabled button")
	}
}

var customEnabledButton = CustomEnabledButton()
customEnabledButton.configure(view: Button())
print(customEnabledButton)

struct CustomDisabledButton: CustomView {
	typealias ViewType = Button
	func configure(view with: ViewType) {
		// configure the view
		print("Disabled button")
	}
}

// let customViews = [CustomSwitch(), CustomEnabledButton(), CustomDisabledButton()]

/// Type Erasure

// Type-erased CustomView
struct AnyCustomView<ViewType>: CustomView {
	private let _configure: (ViewType) -> Void

	init<Base: CustomView>(_ base: Base) where ViewType == Base.ViewType {
		_configure = base.configure
	}

	func configure(view with: ViewType) {
		_configure(with)
	}
}

let views = [AnyCustomView(CustomEnabledButton()), AnyCustomView(CustomDisabledButton())]

let button = Button()


for view in views {
	view.configure(view: button)
	print(view)
}

struct Switch {}

struct CustomSwitch: CustomView {
	typealias ViewType = Switch
	func configure(view with: ViewType) {
		// configure the view
		print("Custom switch")
	}
}

// let views = [AnyCustomView(CustomSwitch()), AnyCustomView(CustomDisabledButton())]
// error: heterogeneous collection literal could only be inferred to '[Any]'; add explicit type annotation if this is intentional

//: [Next](@next)
