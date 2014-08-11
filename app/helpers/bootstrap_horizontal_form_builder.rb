class BootstrapHorizontalFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper

  def initialize(*args)
    ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
      html_tag.html_safe
    end
    super
  end

  def label(attribute, options={})
    unless options[:class].blank?
      unless options[:class].include?("control-label")
        options[:class] << " control-label"
      end
    else
      options[:class] = "control-label"
    end

    super(attribute, options)
  end

  def text_field(attribute, options={})
    unless options[:class].blank?
      unless options[:class].include?("form-control")
        options[:class] <<" form-control"
      end
    else
      options[:class] = "form-control"
    end
    super(attribute, options)
  end

  def input_form_group(attribute, options={})
    has_errors = self.object.errors[attribute].any?
    
    label_html = label(attribute, options[:label])
    text_field_html = text_field(attribute, options[:text_field] || {})

    if has_errors
      text_field_html += content_tag(:span, self.object.errors.full_messages_for(attribute).join('; '), {:class => "help-block"})
    end

    content_tag(:div,
      label_html + content_tag(:div, text_field_html, options[:text_field_wrapper]),
      :class => "form-group #{has_errors ? 'has-error' : ''}")
  end
end