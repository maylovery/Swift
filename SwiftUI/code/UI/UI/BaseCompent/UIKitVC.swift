//
//  UIKitVC.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI
import Foundation
import UIKit

struct UIKitVC: View {
    var body: some View {
        // swiftUI 嵌入UIkit
        GeometryReader { geo in
            ViewControlWapper().frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}

#Preview {
    UIKitVC()
}


struct ViewControlWapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = LoginVC()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


// UIKit的VC
fileprivate class LoginVC: UIViewController {
    private var name = UITextField()
    private var pass = UITextField()
    private var login = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    func setUpUI() {
        name.frame = .init(x: 20, y: 100, width: 200, height: 40)
        pass.frame = .init(x: 20, y: 160, width: 200, height: 40)
        login.frame = .init(x: 20, y: 240, width: 200, height: 40)
        self.view.addSubview(name)
        self.view.addSubview(pass)
        self.view.addSubview(login)
        
        name.placeholder = "请输入用户名"
        pass.placeholder = "请输入密码"
        login.setTitle("登录", for: .normal)
        login.titleLabel?.textColor = .black
        login.addTarget(self, action: #selector(tapLogin), for: .touchUpInside)
    }
    
    @objc func tapLogin() {
        // UIkit 跳转到SwiftUI 界面
        let someView = UIKitToSwiftUIView()
        let hostVC = UIHostingController(rootView: someView)
        self.navigationController?.pushViewController(hostVC, animated: true)
    }
}


struct UIKitToSwiftUIView: View {
    var body: some View {
        VStack {
            Text("这是SwiftUI 界面，从UIKit中跳转")
        }
    }
}
