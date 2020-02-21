# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'


# Clean up
Cocktail.destroy_all
Ingredient.destroy_all


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
Ingredient.create(name: 'Cachaça')

# Mojito cocktail

mojito = Cocktail.create(name: 'Mojito')

file = URI.open('https://images.unsplash.com/photo-1551538827-9c037cb4f32a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1901&q=80')
mojito.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

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

# Cosmopolitan cocktail

cosmopolitan = Cocktail.create(name: 'Cosmopolitan')

Dose.create(description: '45ml',
            cocktail: cosmopolitan,
            ingredient: Ingredient.where(name: 'Lemon vodka').first)
Dose.create(description: '15ml',
            cocktail: cosmopolitan,
            ingredient: Ingredient.where(name: 'Triple sec').first)
Dose.create(description: '30ml',
            cocktail: cosmopolitan,
            ingredient: Ingredient.where(name: 'Cranberry juice').first)
Dose.create(description: '10ml',
            cocktail: cosmopolitan,
            ingredient: Ingredient.where(name: 'Lime juice').first)
Dose.create(description: 'some cubes',
            cocktail: cosmopolitan,
            ingredient: Ingredient.where(name: 'Ice').first)

file = URI.open('https://images.unsplash.com/photo-1556881261-e41e8db21055?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
cosmopolitan.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# Caipirinha cocktail

caipirinha = Cocktail.create(name: 'Caipirinha')

Dose.create(description: '2, chopped into wedges',
            cocktail: caipirinha,
            ingredient: Ingredient.where(name: 'Lime').first)
Dose.create(description: '6 tbsp',
            cocktail: caipirinha,
            ingredient: Ingredient.where(name: 'Sugar').first)
Dose.create(description: '200ml',
            cocktail: caipirinha,
            ingredient: Ingredient.where(name: 'Cachaça').first)
Dose.create(description: 'few handfuls (crushed)',
            cocktail: caipirinha,
            ingredient: Ingredient.where(name: 'Ice').first)

file = URI.open('https://cdn.pixabay.com/photo/2020/01/21/11/36/caipirinha-4782694_960_720.jpg')
caipirinha.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
