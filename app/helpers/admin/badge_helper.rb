module Admin::BadgeHelper
  def image_list
    Dir['app/assets/images/*'].map { |path| File.basename(path) }
  end

  def rule_list
    ['first_attempt', 'by_category', 'by_level']
  end

  def level_list
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
