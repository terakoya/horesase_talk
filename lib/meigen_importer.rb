require 'open-uri'

module MeigenImporter
  module_function
  def import
    response = open('http://horesase-boys.herokuapp.com/meigens.json').read
    meigens = JSON.parse(response)
    Meigen.transaction do
      meigens.each do |meigen|
        puts meigen
        Meigen.create!(title: meigen["title"], body: meigen["body"], image_url: meigen["image"])
      end
    end
  end
end

MeigenImporter.import
