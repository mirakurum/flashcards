class Card < ApplicationRecord

  validates :translated_text, :review_date, presence: true
  validates :original_text, presence: true, uniqueness: true
  validates_with EqualValidator

  before_validation :capitalize_fields_and_create_review_date

  private

  def capitalize_fields_and_create_review_date
    self.original_text = original_text.strip.capitalize
    self.translated_text = translated_text.strip.capitalize
    self.review_date = Time.now + 3.days if !review_date
  end
end
