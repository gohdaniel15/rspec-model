require 'rails_helper'

RSpec.describe Student, type: :model do

  it { is_expected.to validate_presence_of(:first_name) }

  it { is_expected.to validate_presence_of(:last_name) }

  it 'should validate uniqueness of email' do
    student = Student.new(
      first_name: "Daniel",
      last_name: "Goh",
      email: "example@example.com",
      github_url: "http://github.com",
      twitter_url: "http://twitter.com",
      birth_date: DateTime.current
    )
    expect(student).to validate_uniqueness_of(:email).case_insensitive
  end

  it 'should be valid when github_url is valid' do
    student = Student.new(
      first_name: "Daniel",
      last_name: "Goh",
      email: "example@example.com",
      github_url: "http://github.com",
      twitter_url: "http://twitter.com",
      birth_date: DateTime.current
    )
    expect(student.valid?).to eq true
  end

  it 'should be invalid when github_url is invalid' do
    student = Student.new(
      first_name: "Daniel",
      last_name: "Goh",
      email: "example@example.com",
      github_url: "invalidurl",
      twitter_url: "http://twitter.com",
      birth_date: DateTime.current
    )
    expect(student.valid?).to eq false
    expect(student.errors).not_to be_empty
  end

  it 'return a full name when #full_name is called' do
  end


end
