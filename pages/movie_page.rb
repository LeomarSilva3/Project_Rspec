class MoviePage < SitePrism::Page
    include Capybara::DSL
    include RSpec::Matchers
    include RSpec::Expectations

    element :add, '.nc-simple-add'
    element :title, 'input[name=title]'
    element :status, 'input[placeholder=Status]'
    element :value_status, '.el-select-dropdown__item'
    element :year, 'input[name=title]'
    element :release_date, 'input[name=title]'
    element :button, ''
    element :upooad_file, ''
    element :cast, 


    def adicionar()
        add.click
    end
   
    def cadastrar_filmes(titulo,  ano, data_lancamento,cast)
        title.set titulo

        status.click
        

                
        year.set ano

        release_date.set data_lancamento


        actor = find('.input-new-tag')
        
        cast.each do |a|
            actor.set a 
            actor.send_keys :tab
        end 
    end         

end