import Foundation
import Rainbow
import Darwin.POSIX.termios

class InteractiveMenu {
    private var items: [String]
    private var selectedIndex: Int = 0
    private let prompt: String
    private var originalTermios: termios = termios()
    
    // ANSI escape codes
    private let upArrow = "\u{1B}[A"
    private let downArrow = "\u{1B}[B"
    private let enter = "\n"
    private let clearLine = "\u{1B}[2K"
    private let moveUp = "\u{1B}[1A"
    private let moveToStart = "\u{1B}[G"
    
    init(prompt: String, items: [String]) {
        self.prompt = prompt
        self.items = items
    }
    
    func display() -> String? {
        // Configure terminal
        enableRawMode()
        defer { disableRawMode() }
        
        // Initial display
        renderMenu()
        
        while true {
            if let input = readKey() {
                switch input {
                case upArrow:
                    selectedIndex = (selectedIndex - 1 + items.count) % items.count
                    moveAndRenderMenu()
                case downArrow:
                    selectedIndex = (selectedIndex + 1) % items.count
                    moveAndRenderMenu()
                case enter:
                    // Clear menu before returning
                    clearMenu()
                    return items[selectedIndex]
                default:
                    break
                }
            }
        }
    }
    
    private func renderMenu() {
        print(prompt.blue.bold)
        print()
        for (index, item) in items.enumerated() {
            if index == selectedIndex {
                print("→ \(item)".green.bold)
            } else {
                print("  \(item)")
            }
        }
    }
    
    private func moveAndRenderMenu() {
        // Move cursor up to prompt
        for _ in 0...items.count + 1 {
            print(moveUp + clearLine, terminator: "")
        }
        print(moveToStart, terminator: "")
        renderMenu()
    }
    
    private func clearMenu() {
        // Clear all menu items
        for _ in 0...items.count {
            print(moveUp + clearLine, terminator: "")
        }
        print(moveToStart, terminator: "")
    }
    
    private func enableRawMode() {
        var raw = termios()
        tcgetattr(STDIN_FILENO, &originalTermios)
        raw = originalTermios
        
        raw.c_lflag &= ~UInt(ECHO | ICANON)
        
        tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw)
    }
    
    private func disableRawMode() {
        tcsetattr(STDIN_FILENO, TCSAFLUSH, &originalTermios)
    }
    
    private func readKey() -> String? {
        var input = [UInt8](repeating: 0, count: 3)
        let count = read(STDIN_FILENO, &input, 3)
        
        if count == 3 && input[0] == 0x1B && input[1] == 0x5B {
            switch input[2] {
            case 0x41: return upArrow    // Up arrow
            case 0x42: return downArrow  // Down arrow
            default: return nil
            }
        } else if count == 1 && input[0] == 0x0A {
            return enter  // Enter key
        }
        
        return nil
    }
}

// Helper extension for getting user input with a prompt
extension InteractiveMenu {
    static func promptForInput(_ prompt: String) -> String {
        print(prompt.blue.bold, terminator: " ")
        return readLine() ?? ""
    }
}
