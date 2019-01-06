module ViewHelper

  def enum_collection(resource)
    resource.keys.to_a.map { |w| [w.humanize, w] }
  end

  def add_association_link_table(form_attr, nested, table_class, partial, name)
    link_to_add_association name, form_attr, nested, data: {'association-insertion-node': table_class, 'association-insertion-method': 'append'}, partial: partial
  end

  def date_type(date, format)
    if date.present?
      I18n.l(date, {format: format})
    end
  end

end