INSERT INTO Categories (Name, Description) VALUES
('Breakfast', 'Morning meals'),
('Lunch', 'Midday meals'),
('Dinner', 'Evening meals'),
('Dessert', 'Sweet dishes'),
('Snacks', 'Small meals and snacks');

INSERT INTO Ingredients (Name, DefaultUnit) VALUES
('Flour', 'cups'),
('Sugar', 'cups'),
('Eggs', 'each'),
('Milk', 'cups'),
('Butter', 'tablespoons'),
('Chicken Breast', 'ounces'),
('Rice', 'cups'),
('Pasta', 'cups'),
('Tomatoes', 'each'),
('Cheese', 'cups'),
('Olive Oil', 'tablespoons'),
('Salt', 'teaspoons');

INSERT INTO Recipes (Name, Instructions, PrepTimeMinutes, Servings, CategoryId) VALUES
('Pancakes', 'Mix ingredients, pour batter on a hot pan, and cook both sides.', 20, 4,
    (SELECT CategoryId FROM Categories WHERE Name = 'Breakfast')),
('Scrambled Eggs', 'Whisk eggs, cook in butter, and season with salt.', 10, 2,
    (SELECT CategoryId FROM Categories WHERE Name = 'Breakfast')),
('Chicken Rice Bowl', 'Cook chicken, prepare rice, and combine in a bowl.', 35, 3,
    (SELECT CategoryId FROM Categories WHERE Name = 'Dinner')),
('Tomato Pasta', 'Cook pasta and mix with tomatoes, olive oil, and cheese.', 25, 4,
    (SELECT CategoryId FROM Categories WHERE Name = 'Dinner')),
('Grilled Cheese', 'Butter bread, add cheese, and grill until golden.', 15, 1,
    (SELECT CategoryId FROM Categories WHERE Name = 'Lunch')),
('Chocolate Cookies', 'Mix ingredients, shape dough, and bake until done.', 30, 12,
    (SELECT CategoryId FROM Categories WHERE Name = 'Dessert')),
('Fruit Snack Bowl', 'Combine fresh fruit and serve chilled.', 5, 2,
    (SELECT CategoryId FROM Categories WHERE Name = 'Snacks'));

INSERT INTO RecipeIngredients (RecipeId, IngredientId, Quantity, Unit) VALUES
((SELECT RecipeId FROM Recipes WHERE Name = 'Pancakes'),
 (SELECT IngredientId FROM Ingredients WHERE Name = 'Flour'), 2, 'cups'),
((SELECT RecipeId FROM Recipes WHERE Name = 'Pancakes'),
 (SELECT IngredientId FROM Ingredients WHERE Name = 'Eggs'), 2, 'each'),
((SELECT RecipeId FROM Recipes WHERE Name = 'Pancakes'),
 (SELECT IngredientId FROM Ingredients WHERE Name = 'Milk'), 1.5, 'cups'),
((SELECT RecipeId FROM Recipes WHERE Name = 'Scrambled Eggs'),
 (SELECT IngredientId FROM Ingredients WHERE Name = 'Eggs'), 3, 'each'),
((SELECT RecipeId FROM Recipes WHERE Name = 'Chicken Rice Bowl'),
 (SELECT IngredientId FROM Ingredients WHERE Name = 'Chicken Breast'), 12, 'ounces'),
((SELECT RecipeId FROM Recipes WHERE Name = 'Chicken Rice Bowl'),
 (SELECT IngredientId FROM Ingredients WHERE Name = 'Rice'), 2, 'cups'),
((SELECT RecipeId FROM Recipes WHERE Name = 'Tomato Pasta'),
 (SELECT IngredientId FROM Ingredients WHERE Name = 'Pasta'), 2, 'cups'),
((SELECT RecipeId FROM Recipes WHERE Name = 'Tomato Pasta'),
 (SELECT IngredientId FROM Ingredients WHERE Name = 'Tomatoes'), 3, 'each'),
((SELECT RecipeId FROM Recipes WHERE Name = 'Tomato Pasta'),
 (SELECT IngredientId FROM Ingredients WHERE Name = 'Cheese'), 1, 'cups'),
((SELECT RecipeId FROM Recipes WHERE Name = 'Grilled Cheese'),
 (SELECT IngredientId FROM Ingredients WHERE Name = 'Butter'), 1, 'tablespoons');

INSERT INTO Favorites (UserName, RecipeId) VALUES
('Nikitha', (SELECT RecipeId FROM Recipes WHERE Name = 'Pancakes')),
('Nikitha', (SELECT RecipeId FROM Recipes WHERE Name = 'Chicken Rice Bowl')),
('Nikitha', (SELECT RecipeId FROM Recipes WHERE Name = 'Chocolate Cookies'));