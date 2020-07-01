class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name
    if self.artist
      self.artist.name 
    else 
      nil 
    end 
  end 

  def notes_array=(result)
    result.each do |notes|
      self.notes << Note.create(content: notes)
    end 
  end 

end
