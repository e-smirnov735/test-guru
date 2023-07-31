class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :gists, dependent: :destroy
  belongs_to :badge

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def find_tests_by_level(test_level)
    tests.by_level(test_level)
  end

  def test_passage(test)
    test.results.order(id: :desc).find_by(test_id: test.id)
  end

  # def add_backend_badge(test)
  #   test.category == 'backend'
  #   self.badge

  # end
end
