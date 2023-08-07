module Admin::BadgeHelper
  def image_list
    Dir['app/assets/images/*'].map { |path| File.basename(path) }
  end

  def rule_list
    image_list.map { |path| path.delete_suffix('.png') }
  end
end
