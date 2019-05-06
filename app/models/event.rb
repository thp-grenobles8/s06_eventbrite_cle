class Event < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances

  validates :start_date,  presence: true, if: :not_past?
  validates :duration,    presence: true, if: :mod_5?,
                          numericality: { :greater_than => 0 }
  validates :title,       presence: true,
                          length: { minimum: 5,
                                    maximum: 140 }
  validates :description, presence: true,
                          length: { minimum: 20,
                                    maximum: 1_000 }
  validates :price,       presence: true,
                          numericality: { :greater_than => 0,
                                          :less_than    => 1_000 }
  validates :location,    presence: true

  def not_past?
    self.start_date < Time.now
  end

  def mod_5?
    self.duration % 5 == 0
  end


end
