class OriginalAndTranslatedTextFieldsNotEqualValidator < ActiveModel::Validator
  def validate(record)
    if record.original_text == record.translated_text
      record.errors[:translated_text] << 'Перевод не должен
                                          совпадать с оригиналом'
    end
  end
end
