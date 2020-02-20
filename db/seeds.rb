# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'


# Ingredients

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)["drinks"].map{|h| h["strIngredient1"]}

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient)
end

Ingredient.create(name: 'Ice')
Ingredient.create(name: 'Mint')
Ingredient.create(name: 'Club soda')


# 1 cocktail to start with!

mojito = Cocktail.create(name: 'Mojito')


Dose.create(description: '20 leaves',
            cocktail: mojito,
            ingredient: Ingredient.where(name: 'Mint').first)

Dose.create(description: '1/3 cup',
            cocktail: mojito,
            ingredient: Ingredient.where(name: 'Sugar').first)
Dose.create(description: '4 cups',
            cocktail: mojito,
            ingredient: Ingredient.where(name: 'Club soda').first)
Dose.create(description: '3/4 cup',
            cocktail: mojito,
            ingredient: Ingredient.where(name: 'Dark rum').first)
Dose.create(description: '3/4 cup',
            cocktail: mojito,
            ingredient: Ingredient.where(name: 'Lime juice').first)
Dose.create(description: '20 cubes',
            cocktail: mojito,
            ingredient: Ingredient.where(name: 'Ice').first)
Dose.create(description: '1 (quartered)',
            cocktail: mojito,
            ingredient: Ingredient.where(name: 'Lime').first)
