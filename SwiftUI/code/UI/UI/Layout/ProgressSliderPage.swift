//
//  ProgressSliderView.swift
//  UI
//
//  Created by Tao Yu on 2024/4/6.
//

import SwiftUI
import UIKit
import Combine

class SliderViewModel: ObservableObject {
    static var shared: SliderViewModel = SliderViewModel()
    @Published var sliderValue = Double(0)
    @Published var sliderMaximumValue = Double(0)
    @Published var sliderIsUserInteractionEnabled = false
    @Published var sliderPlayableProgress = Double(0)
    var sliderValueChanged = PassthroughSubject<Double, Never>()
    private var cancelBag = Set<AnyCancellable>()

    init() {
        sliderValueChanged
            .removeDuplicates()
            .sink { [weak self] value in
//                self?.seek(value: value)
                self?.sliderValue = value
                print("\(value)")
            }
            .store(in: &cancelBag)
    }
}

struct ProgressSliderPage: View {
    @StateObject var model = SliderViewModel.shared
    var body: some View {
        
        VStack {
            Text("进度条")
            ProgressSliderView(value: $model.sliderValue,
                               maximumValue: $model.sliderMaximumValue,
                               isUserInteractionEnabled: $model.sliderIsUserInteractionEnabled,
                               playableProgress: $model.sliderPlayableProgress) {
                model.sliderValueChanged.send($0)
            }.padding(.horizontal)
        }
    }
}

#Preview {
    ProgressSliderPage()
}


struct ProgressSliderView: UIViewRepresentable {
    @Binding var value: Double
    @Binding var maximumValue: Double
    @Binding var isUserInteractionEnabled: Bool
    @Binding var playableProgress: Double
    var updateValueHandler: (Double) -> Void

    @State private var touching = false

    init(value: Binding<Double>,
         maximumValue: Binding<Double>,
         isUserInteractionEnabled: Binding<Bool>,
         playableProgress: Binding<Double>,
         updateValueHandler: @escaping (Double) -> Void) {
        self._value = value
        self._maximumValue = maximumValue
        self._isUserInteractionEnabled = isUserInteractionEnabled
        self._playableProgress = playableProgress
        self.updateValueHandler = updateValueHandler
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIProgressSlider {
        let slider = UIProgressSlider()
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateValue(sender:)),
            for: .valueChanged)

        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.startTouch(sender:)),
            for: .touchDown)

        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.endTouch(sender:)),
            for: .touchUpInside)

        return slider
    }

    func updateUIView(_ uiView: UIProgressSlider, context: Context) {
        if !touching {
            uiView.value = Float(value)
        }
        uiView.maximumValue = Float(maximumValue)
        uiView.isUserInteractionEnabled = isUserInteractionEnabled
        uiView.playableProgress = Float(playableProgress)
        uiView.setNeedsDisplay()
    }

    class Coordinator: NSObject {
        var view: ProgressSliderView

        init(_ view: ProgressSliderView) {
            self.view = view
        }

        @objc
        func updateValue(sender: UIProgressSlider) {
            view.updateValueHandler(Double(sender.value))
        }

        @objc
        func startTouch(sender: UIProgressSlider) {
            view.touching = true
        }

        @objc
        func endTouch(sender: UIProgressSlider) {
            view.touching = false
        }
    }
}

struct ProgressSliderView_Previews: PreviewProvider {
    @State static var value = Double(50.0)
    @State static var maximumValue = Double(50.0)
    @State static var isUserInteractionEnabled = true
    @State static var playableProgress = Double(70.0)

    static var previews: some View {
        ProgressSliderView(value: $value,
                           maximumValue: $maximumValue,
                           isUserInteractionEnabled: $isUserInteractionEnabled,
                           playableProgress: $playableProgress) {
            print("value changed: \($0)")
        }
    }
}


class UIProgressSlider: UISlider {
    var playableProgress: Float = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        maximumTrackTintColor = .clear
        
        self.tintColor = UIColor.red

        let c = UIGraphicsGetCurrentContext()
        let r = trackRect(forBounds: bounds)
        let path = UIBezierPath(roundedRect: r, cornerRadius: r.size.height / 2.0)
        c?.addPath(path.cgPath)
        c?.setLineWidth(0.1)

        UIColor.black.setStroke()
        c?.strokePath()

        c?.addPath(path.cgPath)
        c?.clip()

        UIColor.lightGray.setFill()
        c?.fill(CGRect(x: r.origin.x,
                       y: r.origin.y,
                       width: r.size.width,
                       height: r.size.height))

        UIColor.white.setFill()
        c?.fill(CGRect(x: r.origin.x,
                       y: r.origin.y,
                       width: r.size.width * CGFloat(playableProgress),
                       height: r.size.height))
    }
}
