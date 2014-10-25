class Meigen < ActiveRecord::Base
  class << self
    def sample
      self.offset(rand(self.count)).limit(1).first
    end

    def search(sentence)
      natto = Natto::MeCab.new
      words = []
      natto.parse(sentence) do |n|
        n.surface
        part = n.feature.split(',')[0] # 品詞
        if ["動詞", "名詞"].include?(part)
          words << n.surface
        end
      end

      # 非効率なクエリですが、レコードが1500件程度なので許してください
      self.where('body LIKE ?', "%#{words.sample}%").sample
    end
  end
end
