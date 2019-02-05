//
//  ITRRedViewController.swift
//  ITRRedCocoaPod
//
//  Created by Homyakov, Ilya2 on 05/02/2019.
//  Copyright © 2019 Homyakov, Ilya2. All rights reserved.
//

import UIKit

class ITRRedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red;
        self.makeBackButton()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    public static func showFromViewController(_ parentViewController: UIViewController) {
        let viewController = ITRRedViewController()
        viewController.showFromViewController(parentViewController)
    }

    public func showFromViewController(_ parentViewController: UIViewController) {
        guard let navigationController = parentViewController.navigationController else {
            parentViewController.show(self, sender: nil)
            return
        }

        navigationController.pushViewController(self, animated: true)
    }

    // MARK: Events

    @IBAction func backAction(_ sender: Any) {
        guard let navigationController = navigationController else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        navigationController.popViewController(animated: true)
    }

    private func makeBackButton() {
        let button = UIButton()
        button.setTitle("go back", for: .normal)
        button.addTarget(self, action: #selector(backAction(_:)), for: UIControl.Event.touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
