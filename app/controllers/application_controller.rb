class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Instructor)
      static_pages_instructor_path
    elsif resource_or_scope.is_a?(Student)
      static_pages_student_path
    end
  end

end
