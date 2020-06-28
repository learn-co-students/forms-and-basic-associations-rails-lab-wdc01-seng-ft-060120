class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def song_notes=(notes)
    notes.each do |note|
      new_note = Note.create(content: note)
      self.notes << new_note
    end
  end

  def song_notes
    self.notes ? self.notes.each {|note| note.content} : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
end
