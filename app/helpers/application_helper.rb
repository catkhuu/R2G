module ApplicationHelper
  def full_title(page_title = '')
    base_title = "R2G"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def read_only_text_field(object_name, method, options = {})
    text_field(object_name, method, :disabled => true)
  end


end
