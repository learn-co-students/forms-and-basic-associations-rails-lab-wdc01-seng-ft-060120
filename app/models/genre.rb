class Genre < ActiveRecord::Base
  has_many :songs

  def genre_name
    self.genre.name
  end
end
