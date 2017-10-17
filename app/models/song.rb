class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  with_options if: :released? do |release|
    release.validates :release_year, presence: true
    release.validates :release_year, numericality: { :less_than_or_equal_to => Date.today.year }
  end
  validates :artist_name, presence: true
  validates :genre, presence: true

  def released?
    released
  end

end
