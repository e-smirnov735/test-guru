module Admin::BadgeHelper
  def image_list
    Dir['app/assets/images/*'].map { |path| File.basename(path) }
  end
end
