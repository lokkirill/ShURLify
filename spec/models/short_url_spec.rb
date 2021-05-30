# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortUrl do
  describe 'target_url validations' do
    it { should validate_presence_of(:target_url) }
    it { is_expected.to validate_url_of(:target_url) }
  end

  describe '.create' do
    subject { described_class.create(target_url: Faker::Internet.url) }

    it 'autofills uniq key' do
      expect(subject.key).not_to be_empty
    end
  end
end
