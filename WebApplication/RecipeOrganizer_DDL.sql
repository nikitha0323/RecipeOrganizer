IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Categories] (
    [CategoryId] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    [Description] nvarchar(max) NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY ([CategoryId])
);
GO

CREATE TABLE [Ingredients] (
    [IngredientId] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    [DefaultUnit] nvarchar(max) NULL,
    CONSTRAINT [PK_Ingredients] PRIMARY KEY ([IngredientId])
);
GO

CREATE TABLE [Recipes] (
    [RecipeId] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    [Instructions] nvarchar(max) NOT NULL,
    [PrepTimeMinutes] int NOT NULL,
    [Servings] int NOT NULL,
    [CategoryId] int NOT NULL,
    CONSTRAINT [PK_Recipes] PRIMARY KEY ([RecipeId]),
    CONSTRAINT [FK_Recipes_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Categories] ([CategoryId]) ON DELETE CASCADE
);
GO

CREATE TABLE [Favorites] (
    [FavoriteId] int NOT NULL IDENTITY,
    [UserName] nvarchar(max) NOT NULL,
    [RecipeId] int NOT NULL,
    CONSTRAINT [PK_Favorites] PRIMARY KEY ([FavoriteId]),
    CONSTRAINT [FK_Favorites_Recipes_RecipeId] FOREIGN KEY ([RecipeId]) REFERENCES [Recipes] ([RecipeId]) ON DELETE CASCADE
);
GO

CREATE TABLE [RecipeIngredients] (
    [RecipeIngredientId] int NOT NULL IDENTITY,
    [RecipeId] int NOT NULL,
    [IngredientId] int NOT NULL,
    [Quantity] decimal(8,2) NOT NULL,
    [Unit] nvarchar(max) NULL,
    CONSTRAINT [PK_RecipeIngredients] PRIMARY KEY ([RecipeIngredientId]),
    CONSTRAINT [FK_RecipeIngredients_Ingredients_IngredientId] FOREIGN KEY ([IngredientId]) REFERENCES [Ingredients] ([IngredientId]) ON DELETE CASCADE,
    CONSTRAINT [FK_RecipeIngredients_Recipes_RecipeId] FOREIGN KEY ([RecipeId]) REFERENCES [Recipes] ([RecipeId]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_Favorites_RecipeId] ON [Favorites] ([RecipeId]);
GO

CREATE INDEX [IX_RecipeIngredients_IngredientId] ON [RecipeIngredients] ([IngredientId]);
GO

CREATE INDEX [IX_RecipeIngredients_RecipeId] ON [RecipeIngredients] ([RecipeId]);
GO

CREATE INDEX [IX_Recipes_CategoryId] ON [Recipes] ([CategoryId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20261015150845_InitialCreate', N'8.0.0');
GO

COMMIT;
GO

