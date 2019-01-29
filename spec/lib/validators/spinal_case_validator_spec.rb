require 'spec_helper'

require 'validators/spinal_case_validator'

RSpec.describe SpinalCaseValidator do
  describe 'validate_each' do
    let(:model_class) do
      Struct.new(:slug) do
        include ActiveModel::Validations
        validates :slug, spinal_case: true
      end
    end

    context 'valid format' do
      valid_strings = %w[
        a
        1
        a-1b
        abc-123-d
      ]

      valid_strings.each do |valid_string|
        it "#{valid_string} should be valid" do
          obj = model_class.new(valid_string)
          expect(obj).to be_valid
        end
      end
    end

    context 'invalid format' do
      invalid_strings = %w[
        -
        a-
        -1
        a--1
        A
      ]

      invalid_strings.each do |invalid_string|
        it "#{invalid_string} should not be valid" do
          obj = model_class.new(invalid_string)
          expect(obj).not_to be_valid
        end
      end
    end

    context 'allow_blank: true given' do
      let(:model_class_allowing_blank) do
        Struct.new(:tel) do
          include ActiveModel::Validations
          validates :tel, spinal_case: true, allow_blank: true
        end
      end

      it 'blank string should be valid' do
        obj = model_class_allowing_blank.new('')
        expect(obj).to be_valid
      end
    end
  end
end
