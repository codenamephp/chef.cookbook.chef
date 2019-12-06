# frozen_string_literal: true

if defined?(ChefSpec)
  def does_append_if_no_line(name)
    ChefSpec::Matchers::ResourceMatcher.new(:append_if_no_line, :edit, name)
  end
end
