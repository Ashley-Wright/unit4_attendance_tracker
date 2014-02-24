module ApplicationHelper
  def resource_name
    :instructor
  end

  def resource
    @resource ||= Instructor.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:instructor]
  end
end
