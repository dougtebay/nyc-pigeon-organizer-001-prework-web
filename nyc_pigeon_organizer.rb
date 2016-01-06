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