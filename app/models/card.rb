class Card < ApplicationRecord

  validates :translated_text, :review_date, presence: true
  validates :original_text, presence: true, uniqueness: true
  validate :equal_validate

  before_validation :capitalize_fields_and_create_review_date

  private

  def equal_validate
    if original_text == translated_text
      errors[:base] << 'Поля не должны совпадать'
    end
  end

  def capitalize_fields_and_create_review_date
    self.original_text = original_text.strip.capitalize
    self.translated_text = translated_text.strip.capitalize
    self.review_date = Time.now + 3.days if !review_date
  end
end
