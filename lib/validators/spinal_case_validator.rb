require 'active_model'

class SpinalCaseValidator < ActiveModel::EachValidator
  REGEXP   = /\A[a-z0-9]+(-[a-z0-9]+)*\z/

  def validate_each(record, attribute, value)
    unless value.to_s =~ REGEXP
      record.errors.add(attribute, 'must be spinal case like spinal-case')
    end
  end
end
