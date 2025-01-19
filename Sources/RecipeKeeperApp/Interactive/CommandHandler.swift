//
//  CommandHandler.swift
//  RecipeKeeperApp
//
//  Created by Parth Patel on 1/19/25.
//
enum CommandType {
    case menu
    case text
}

protocol BaseCommand {
    var query: String { get }
    var type: CommandType { get }
}


struct MenuCommand: BaseCommand {
    let query: String
    let type: CommandType
    let label: String?
    let options: [String]
    let subCommands: [String: [Command]]?
}

struct TextCommand: BaseCommand {
    let query: String
    let type: CommandType
}

enum Command {
    case textCommand(TextCommand)
    case menuCommand(MenuCommand)
}

extension Command {
    static func create(
        query: String,
        type: CommandType,
        label: String? = nil,
        options: [String]? = nil,
        subCommands: [String: [Command]]? = nil) -> Command {
            switch type {
                case .menu:
                    guard let menuOptions = options else {
                        fatalError("Options are required for menu type commands")
                    }
                return .menuCommand(MenuCommand(
                    query: query,
                    type: type,
                    label: label ?? "Unlabelled question:",
                    options: menuOptions,
                    subCommands: subCommands
                ))
                case .text:
                    return .textCommand(TextCommand(query: query, type: type))
            }
        }
}


func recursivePrompt(_ command: Command) ->  String {
    switch command {
    case .menuCommand(let menuCommand):
        var question = InteractiveMenu(prompt: menuCommand.query, items: menuCommand.options)
        guard let answer = question.display() else {
            return "Done"
        }

        print("Answer captured: \(answer)")
        if let selectedSubQuestions = menuCommand.subCommands?[answer] {
            for question in selectedSubQuestions {
                recursivePrompt(question)
            }
        }
    case .textCommand(let textCommand):
        print(textCommand.query)
        let answer  = readLine() ?? ""
        print("Answer captured: \(answer)")
    }
    return "Done"
}

class CommandHandler {
    var selections: [String: String] = [:]
    var command: Command
    init(command: Command) {
        self.command = command
    }
    
    func start() {
        recursivePrompt(self.command)
    }
}
