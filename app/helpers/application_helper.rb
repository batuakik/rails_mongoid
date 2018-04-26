module ApplicationHelper
  def form_errors(object)
    render('share/error', object: object) unless object.blank?
  end
end
