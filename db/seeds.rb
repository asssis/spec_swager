20.times do
   artigo = Artigo.new({
        titulo: Faker::Lorem.paragraphs.first,
        texto: Faker::Lorem.paragraphs(number: [2,3,4,5].sample).join("\n"),
        autor: Faker::Name.name  
    })
    artigo.save
end