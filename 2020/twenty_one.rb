require "set"

module DayTwentyOne
	Meal = Struct.new(:ingredients, :allergens)

	def self.run(input)
		allergen_graph = {}
		ingredient_graph = {}
		meals = []

		input
			.lines
			.map(&:strip)
			.each do |l|
				allergens = l[/[(]contains .*[)]/]
					.tr("()", "")
					.sub("contains ", "")
					.split(", ")

				ingredients = l
					.split("(contains", 2)
					.first
					.split(" ")

				meals << Meal.new(Set.new(ingredients), Set.new(allergens))

				ingredients
					.each do |i|
						allergens.each do |a|
							allergen_graph[a] ||= Set.new
							allergen_graph[a] << i

							ingredient_graph[i] ||= Set.new
							ingredient_graph[i] << a
						end
					end
			end

		until allergen_graph.values.inject(&:|).count == 3
			ingredients = ingredient_graph.keys 

			ingredients.each do |ingredient|
				potential_allergens = ingredient_graph[ingredient]

				meals.each do |meal|
					common_allergens = meal.allergens & potential_allergens
					unless common_allergens.empty?
						unless meal.ingredients.include?(ingredient)
							common_allergens.each do |a|
								allergen_graph[a].delete(ingredient)
							end
						end
					end
				end
			end
		end

		allergenic_ingredients = allergen_graph.values.inject(&:|)
		safe_ingredients = Set.new(ingredient_graph.keys) - allergenic_ingredients

		meals.reduce(0) { |sum, meal| sum + (meal.ingredients & safe_ingredients).count }
	end
end
