# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dose.destroy_all

Ingredient.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

Cocktail.destroy_all

cocktails = {
  long_island: Cocktail.create(name: "Long Island"),
  mojito: Cocktail.create(name: "Mojito"),
  white_russian: Cocktail.create(name: "White Russian"),
  caipirinha: Cocktail.create(name: "Caipirinha"),
  gin_tonic: Cocktail.create(name: "Gin Tonic")
}

doses = {
  long_island: [
    Dose.create(ingredient: Ingredient.find_by_name("Vodka"), description: "1,5 cl"),
    Dose.create(ingredient: Ingredient.find_by_name("Gin"), description: "1,5 cl"),
    Dose.create(ingredient: Ingredient.find_by_name("Rum"), description: "1,5 cl"),
    Dose.create(ingredient: Ingredient.find_by_name("Triple sec"), description: "1,5 cl"),
    Dose.create(ingredient: Ingredient.find_by_name("Tequila"), description: "1,5 cl"),
    Dose.create(ingredient: Ingredient.find_by_name("Lemon juice"), description: "1 cl"),
    Dose.create(ingredient: Ingredient.find_by_name("Coca-Cola"), description: "3 cl")
  ],
  mojito: [
    Dose.create(ingredient: Ingredient.find_by_name("Rum"), description: "5 cl"),
    Dose.create(ingredient: Ingredient.find_by_name("Lime"), description: "half one"),
    Dose.create(ingredient: Ingredient.find_by_name("Brown sugar"), description: "two teaspoons"),
    Dose.create(ingredient: Ingredient.find_by_name("Carbonated water"), description: "fill the glass"),
    Dose.create(ingredient: Ingredient.find_by_name("Angostura bitters"), description: "few drops"),
    Dose.create(ingredient: Ingredient.find_by_name("Ice"), description: "crushed")
  ],
  white_russian: [
    Dose.create(ingredient: Ingredient.find_by_name("Vodka"), description: "5 cl"),
    Dose.create(ingredient: Ingredient.find_by_name("Coffee liqueur"), description: "2 cl"),
    Dose.create(ingredient: Ingredient.find_by_name("Milk"), description: "3 cl"),
    Dose.create(ingredient: Ingredient.find_by_name("Ice"), description: "cubes")
  ],
  caipirinha: [
    Dose.create(ingredient: Ingredient.find_by_name("Cachaca"), description: "4 cl"),
    Dose.create(ingredient: Ingredient.find_by_name("Lime"), description: "one"),
    Dose.create(ingredient: Ingredient.find_by_name("Powdered sugar"), description: "two teaspoons"),
    Dose.create(ingredient: Ingredient.find_by_name("Ice"), description: "cubes")
  ],
  gin_tonic: [
    Dose.create(ingredient: Ingredient.find_by_name("Gin"), description: "3 cl"),
    Dose.create(ingredient: Ingredient.find_by_name("Tonic water"), description: "fill the glass"),
    Dose.create(ingredient: Ingredient.find_by_name("Lemon peel"), description: "few zests"),
    Dose.create(ingredient: Ingredient.find_by_name("Cayenne pepper"), description: "few grains")
  ]
}

urls = {
  long_island: 'http://havana-club.ca/sites/default/files/long_island.png',
  mojito: 'http://images.marmitoncdn.org/recipephotos/multiphoto/e1/e1de48f5-a541-4ff9-ad12-002941669e36_normal.jpg',
  white_russian: 'http://www.kahlua.com/globalassets/classic-cocktails/white-russian/kahlua-white-russian-highlighted.png/CocktailHighlight',
  caipirinha: 'http://cucafrescaspirit.com/wp-content/files_mf/cache/th_e163919b020bc293009280a9f28b0587_cocktail_notes.png',
  gin_tonic: 'http://lecahier.com/wp-content/uploads/2015/01/gintonic.jpg'
}

cocktails.each do |key, value|
  value.photo_url = urls[key]
  doses[key].each { |dose| value.doses << dose }
end
