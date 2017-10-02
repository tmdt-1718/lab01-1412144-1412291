module ApplicationHelper
  def home_page_active?
    ['home'].index(params[:controller]).present?
  end
  def blogs_page_active?
    ['blogs'].index(params[:controller]).present?
  end
  def about_page_active?
    ['about'].index(params[:controller]).present?
  end
  def albums_page_active?
    ['albums'].index(params[:controller]).present?
  end
end
