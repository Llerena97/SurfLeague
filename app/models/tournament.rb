class Tournament < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :place, :initial_date, :finish_date, presence: true
  validates :tournament_categories, presence: true
  has_many :tournament_categories, dependent: :delete_all
  has_many :categories, through: :tournament_categories
  has_many :groups
  accepts_nested_attributes_for :tournament_categories, reject_if: :all_blank, allow_destroy: true
  validate :finish_after_initial, if: :date_exists?

  def finish_after_initial
    return if initial_date >= Date.today and finish_date >= initial_date
    errors.add(:finish_date, "must be after the initial date")
  end
  
  private
  def date_exists?
    initial_date && finish_date
  end
end
