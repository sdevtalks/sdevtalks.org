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
      it 'should be valid' do
        expect(model_class.new('a')).to be_valid
        expect(model_class.new('1')).to be_valid
        expect(model_class.new('a-1b')).to be_valid
        expect(model_class.new('abc-123-d')).to be_valid
      end
    end

    context 'invalid format' do
      it 'should not be valid' do
        expect(model_class.new('-')).not_to be_valid
        expect(model_class.new('a-')).not_to be_valid
        expect(model_class.new('-1')).not_to be_valid
        expect(model_class.new('a--1')).not_to be_valid
        expect(model_class.new('A')).not_to be_valid
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
        expect(model_class_allowing_blank.new('')).to be_valid
      end
    end
  end
end
