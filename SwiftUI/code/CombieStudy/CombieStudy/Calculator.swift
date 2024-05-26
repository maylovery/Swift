//
//  Calculator.swift
//  CombieStudy
//
//  Created by Tao Yu on 2024/4/10.
//

import SwiftUI

struct Calculator: View {
    let row: [CalculatorButtonItem] = [
        .digit(1), .digit(2), .digit(3), .op(.plus)
    ]
    let scale: CGFloat = UIScreen.main.bounds.width / 414
    
    @State private var brain: CalculatorBrain = .left("0")
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            // 计算结果
            Text("0")
                .font(.system(size: 76))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad()
                .padding(.bottom)
        }
        .scaleEffect(scale)
    }
}

#Preview {
    Calculator()
}



enum CalculatorButtonItem: Hashable {
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    enum Command: String { 
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    // 数字
    case digit(Int)
    // 点
    case dot
    // 加减乘除操作符
    case op(Op)
    // 其他命令
    case command(Command)
    
}

extension CalculatorButtonItem { 
    var title: String {
        switch self {
            case .digit(let value): 
                return String(value)
            case .dot:
                return "."
            case .op(let op): 
                return op.rawValue
            case .command(let command): 
                return command.rawValue
        }
    }
    var size: CGSize { 
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 88 * 2 + 8, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    var backgroundColor: Color {
        switch self {
        case .digit, .dot: return .black
        case .op: return .orange
        case .command: return .gray
        }
    }
}
// 多行
struct CalculatorButtonPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        
        [.digit(0), .dot, .op(.equal)]
    ]
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
            
        }
    }
}




//  一行
struct CalculatorButtonRow : View {
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColor: item.backgroundColor){
                        print("Button: \(item.title)")
                    }
            }
        }
    }
}

// 每个按钮
struct CalculatorButton : View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColor: Color
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height)
                .background(backgroundColor)
                .cornerRadius(size.width / 2)
        }
        // 1. Modifier 顺序的影响?
        
    }
}

var formatter: NumberFormatter = {
    let f = NumberFormatter()
    f.minimumFractionDigits = 0
    f.maximumFractionDigits = 8
    f.numberStyle = .decimal
    return f
}()

// 计算器的四种状态，定义枚举 左侧数字 + 计算符号 + 右侧数字 + 计算 符号或等号
enum CalculatorBrain {
    // 只有数字结果
    case left(String) //" 1
    // 文字 加操作符
    case leftOp(left: String, op: CalculatorButtonItem.Op)  //!" 2
    // 左数字，操作符，右数字
    case leftOpRight( left: String, op: CalculatorButtonItem.Op, right: String) // !" 3
    // 错误
    case error // !" 4
    

    var output: String {
        var result: String = "0"
        switch self {
        case .left(let left): 
            result = left
        case .leftOp(let left, _):
            result = left
        case let .leftOpRight(left, op, right):
            result = left
        default: break
        }
        guard let value = Double(result) else {
            return "Error"
        }
        return formatter.string(from: value as NSNumber)!
    }
    
    func apply(item: CalculatorButtonItem) -> CalculatorBrain {
        switch item {
        case .digit(let num):
            return apply(num: num)
        case .dot:
            return applyDot()
        case .op(let op):
            return apply(op: op)
        case .command(let command):
            return apply(command: command)
        }
    }
    
    func apply(num: Int) -> CalculatorBrain  {
        return CalculatorBrain.error
    }
    func apply(op: CalculatorButtonItem.Op) -> CalculatorBrain {
        return CalculatorBrain.error
    }
    func apply(command: CalculatorButtonItem.Command) -> CalculatorBrain {
        return CalculatorBrain.error
    }
    func applyDot() -> CalculatorBrain {
        return CalculatorBrain.error
    }
    
}

typealias CalculatorState = CalculatorBrain
typealias CalculatorStateAction = CalculatorButtonItem


struct Reducer { 
    static func reduce(state: CalculatorState, action: CalculatorStateAction) -> CalculatorState {
        return state.apply(item: action)
    }
}
