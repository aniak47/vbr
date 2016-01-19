module StaffsHelper
    # Returns the Gravatar for the given user.
  def gravatar_for(staff, options = { size: 80 })
    size = options[:size]
    if staff.avatar_url.present?
      gravatar_url = staff.avatar_url
    else
      #default_url = "#{root_url}images/guest.png"
      gravatar_id = Digest::MD5::hexdigest(staff.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    end
    image_tag(gravatar_url, alt: staff.name, class: "gravatar", width: size)
  end
end
