class Test < ApplicationRecord
  def self.find_by_category(name)
    Test.joins("JOIN categories ON tests.category_id = categories.id")
        .where("categories.title = ?", name)
        .order(title: :desc)
  end
end
