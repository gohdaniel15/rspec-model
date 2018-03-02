class Student < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  validates :github_url, presence: true,
                         format: { with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix, multiline: true }
  validates :twitter_url, presence: true
  validates :birth_date, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
