class SidebarPage < SitePrism::Page
    include Capybara::DSL
    include RSpec::Matchers
    include RSpec::Expectations

    element :user, '.sidebar-wrapper .user .info span'

    def user_authenticated()
        user.text
    end

end