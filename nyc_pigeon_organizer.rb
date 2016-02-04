require 'pry'

      data = {
        :color => {
          :purple => ["Theo", "Peter Jr.", "Lucky"],
          :grey => ["Theo", "Peter Jr.", "Ms. K"],
          :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
          :brown => ["Queenie", "Alex"]
        },
        :gender => {
          :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
          :female => ["Queenie", "Ms. K"]
        },
        :lives => {
          "Subway" => ["Theo", "Queenie"],
          "Central Park" => ["Alex", "Ms. K", "Lucky"],
          "Library" => ["Peter Jr."],
          "City Hall" => ["Andrew"]
        }
      }
=begin
def nyc_pigeon_organizer(data)
  new_hash = {}
  data.each do |category, pigeon_data|
    pigeon_data.each do |attribute, pigeons|
      pigeons.each do |pigeon|
        new_hash[pigeon] = {color: [], gender: [], lives: []} unless new_hash[pigeon]
        new_hash[pigeon][:color] << attribute.to_s if category == :color && pigeons.include?(pigeon)
        new_hash[pigeon][:gender] << attribute.to_s if category == :gender && pigeons.include?(pigeon)
        new_hash[pigeon][:lives] << attribute if category == :lives && pigeons.include?(pigeon)
      end
    end
  end
  new_hash
end
=end
# Refactored code from lecture

def nyc_pigeon_organizer(data)
  # First get the names of the pigeons
  names = names(data)
  initial_structure = initial_structure(names)
  populate(initial_structure, data, names)
end

#OK
def names(data)
  data.fetch(:gender).values.flatten
end

#OK
def initial_structure(names)
  names.each_with_object({}) do |name, initial_structure|
    initial_structure[name] = {:color => [], :gender => [], :lives => []}
  end
end

#OK
def populate(initial_structure, data, names)
  # In our data, look at the pigeons_with_propery_value or each property_value
  # If the pigeons_with_property_values includes a particular pigeon, add the
  # property_value to that pigeons property_array
  names.each_with_object(initial_structure) do |name, initial_structure|
    properties(data).each do |property|
      initial_structure[name][property] = find_pigeon_property_values(name, property, data) # {:color => [], :gender => [], :lives = []}
    end
  end
end

def find_pigeon_property_values(name, property, data)
  data.fetch(property).collect do |property, pigeons_with_property_value|
    if pigeons_with_property_value.include?(name)
      property.to_s
    end
  end.compact
end

#OK
def properties(data)
  data.keys
end