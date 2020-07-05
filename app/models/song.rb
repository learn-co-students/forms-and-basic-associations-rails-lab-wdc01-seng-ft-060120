class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # add associations here
  def artist_name=(x)
    self.artist = Artist.find_or_create_by(name: x)
  end 

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(x)
    x.each { |y| self.notes.build(content: y) if y != ""}   
  end 

  def note_contents
    self.notes.map { |i|  i.content  if self.notes != nil }
  end 


end
