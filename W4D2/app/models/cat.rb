=begin
  name,
  birth_date,
  color,
  sex,
  description
=end

class Cat < ApplicationRecord
  COLORS = %w(
    Black
    Gray
    White
    Orange
    Yellow
    Green
    Calico
    Tabby
    Colourpoint
  )


  validates :name, :birth_date, :sex, presence: true
  validates_inclusion_of :color, in: COLORS
  validate :sex_length

  def sex_length
    return self.errors[:sex] << 'Sex argument error' if sex.nil?
    unless sex.length == 1 &&
      (sex =~ /M|F/).integer?
      self.errors[:sex] << 'sex validation error'
    end
  end

################################################
  has_many :cat_rental_requests,
    dependent: :destroy,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: :CatRentalRequest







end
