module ApplicationHelper
  def auth_token
    auth_token = "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'>"
    auth_token.html_safe
  end

  def controller?(*controller)
   controller.include?(params[:controller])
  end

 def action?(*action)
   action.include?(params[:action])
 end
 
end
