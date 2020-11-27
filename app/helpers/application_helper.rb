module ApplicationHelper
    def is_active_text(is_active)
        is_active ? 'Active' : 'Inactive'
    end

    def is_active_toggle_text(is_active)
        is_active ? 'Deactivate' : 'Activate'
    end

    def boolean_icon(value)
        icon_config = value ? ['success', 'check'] : ['danger', 'ban']
        content_tag(:i, nil, class: "fa fa-#{icon_config[1]} text-#{icon_config[0]}" )
    end

    def delete_btn(object)
        link_to 'Delete', object, method: :delete, data: { confirm: 'Are you sure?'}, class: 'btn btn-outline-danger btn-sm', remote: true, style: 'float:right;'
    end

    def view_btn(object)
        link_to 'View', object, class: 'btn btn-outline-primary btn-sm'
    end

    def edit_btn(object)
        link_to 'Edit', send("edit_#{object.class.to_s.underscore}_path", object), class: 'btn btn-outline-primary', remote: true
    end

    def submit_btn(form, style)
        form.submit 'Submit', class: 'btn btn-outline-primary', style: "#{style}"
    end

    def is_active_toggle_style(is_active)
        is_active ? 'danger' : 'success'
    end

    def is_active_style(is_active)
        is_active ? 'success' : 'danger'
    end

    def active_select_tag(name, value)
        options = [["Active","true"], ["Inactive", "false"], ["All", "all"]]
        content_tag("select", options_for_select(options, value), name: name, class: 'is_active_filter')
    end
end
