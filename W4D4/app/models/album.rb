# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  type       :string           not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_albums_on_band_id  (band_id) UNIQUE
#

class Album < ApplicationRecord
  validates :name, :band_id, presence: true
  validates :band_id, uniqueness: true

  belongs_to :band,
    foreign_key: :band_id,
    class_name: :Band

    def new
      @album = Album.new
      render :new
    end

    def create
      self.band_id = band.id # ?
      @album = Album.create(album_params)
    end

    def show
    end

end
