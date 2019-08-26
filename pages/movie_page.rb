class MoviePage < SitePrism::Page
    include Capybara::DSL
    include RSpec::Matchers
    include RSpec::Expectations

    element :icone_cadstro, '.nc-simple-add'
    element :title, 'input[name=title]'
    element :status, 'input[placeholder=Status]'
    element :value_status, '.el-select-dropdown__item'
    element :year, 'input[name=title]'
    element :release_date, 'input[name=title]'
    element :button, ''
    element :upooad_file, ''


   
    def cadastrar_filmes(title, year,release_date,cast)

        title.set filme[title]

        status.click
        #value_status (text:filme["status"]).click

        year.set filme[year]

        release_date.set filme[release_date]
        release_date.send_keys :tab
    
        actor = find('.input-new-tag')
        
        filme[cast].each do |a|
            actor.set a 
            actor.send_keys :tab
        end
       
    end

end