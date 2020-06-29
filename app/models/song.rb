class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(inp)
    self.artist = Artist.find_or_create_by(name: inp)
  end

  def note_contents=(content_list)
    content_list.each do |note_content|
      if note_content != ""  
        note = self.notes.build(content: note_content)
        note.save
      end
    end
  end  


end
