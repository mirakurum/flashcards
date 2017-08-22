class EqualValidator < ActiveModel::Validator
  def validate(record)
    if record.original_text == record.translated_text
      record.errors[:base] << 'Поля не должны совпадать'
    end
  end
end
