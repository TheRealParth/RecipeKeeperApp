import Foundation
import Rainbow

struct RecipeKeeperApp {
    static func main() {
        CommandHandler(command: Command.create(
            query: "Please select an action: ",
            type: .menu,
            options: ["Add a new recipe", "List all recipes", "Find a recipe", "Exit"],
               subCommands: [
                "Add a new recipe": [Command.create(query: "Please enter a name for your recipe: ", type: .text),
                                     Command.create(query: "Please enter the category of your recipe: ",
                                                    type: .menu,
                                                    options: ["Appetizer", "Main Course", "Dessert", "Side", "Snack"]
                                                   )],
                "List all recipes": [Command.create(query: "", type: .text)],
                "Find a recipe": [Command.create(query: "Please enter a name for your recipe: ", type: .text)],
                "Exit": [Command.create(query: "", type: .text)]
            ])).start()
    }
}


RecipeKeeperApp.main()
