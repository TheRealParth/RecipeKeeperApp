# Recipe Keeper CLI App

## **Product Requirements**

### **Core Features**

1. **Add a Recipe**  
   - Allow users to input a recipe title, ingredients, and steps.  
   - Save recipes to a local file (e.g., JSON format).

2. **View All Recipes**  
   - List all saved recipes in a user-friendly format.

3. **Search Recipes**  
   - Allow users to search for recipes by title or ingredient.  
   - Display matching recipes.

4. **Delete a Recipe**  
   - Allow users to delete a recipe by its title.  
   - Update the stored data file accordingly.

5. **Export Recipes**  
   - Export all recipes to a CSV file for easy sharing.

---

### **Additional Requirements**

- **Command-Line Interface (CLI)**:  
  Users should interact with the app via CLI commands like `add`, `view`, `search`, `delete`, and `export`.

- **Data Persistence**:  
  Store recipes in a local JSON file.  
  Ensure data integrity with proper error handling during file read/write operations.

- **Input Validation**:  
  Validate user input to ensure no empty fields or duplicate recipe titles.

- **Error Handling**:  
  Handle errors gracefully, such as missing files, invalid input, or empty search results.

---

### **Optional Features (For Stretch Goals)**

1. **Categories**:  
   Allow users to categorize recipes (e.g., Dessert, Main Course, etc.).

2. **Favorite Recipes**:  
   Mark certain recipes as favorites for quick access.

3. **Recipe Rating**:  
   Allow users to rate recipes and sort them by rating.

4. **Recipe Timer**:  
   Add a simple timer feature for cooking steps.

---

### **Core Swift Concepts Covered**

- **Data Structures**: Model recipes using structs or classes.  
- **File I/O**: Read from and write to JSON/CSV files.  
- **Protocols**: Define a protocol for exporting recipes in multiple formats.  
- **Error Handling**: Manage potential errors in user input and file operations.  
- **Extensions**: Extend functionality for formatting or handling specific tasks.  
- **CommandLine API**: Process and parse command-line arguments.

---
