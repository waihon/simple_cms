# Reviewing...
module ApplicationHelper

  def error_messages_for(object)
    # object passed in could be an array, a single object, or a nil
    objects = Array(object)
    render(:partial => 'application/error_messages',
      :locals => {:objects => objects})
  end

  def status_tag(boolean, options={})
    options[:true_text]  ||= ''
    options[:false_text] ||= ''

    if boolean
      content_tag(:span, options[:true_text], :class => 'status true')
    else
      content_tag(:span, options[:false_text], :class => 'status false')
    end
  end

end
