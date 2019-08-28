class MoviePage < SitePrism::Page
    include Capybara::DSL
    include RSpec::Matchers
    include RSpec::Expectations

    element :add, '.nc-simple-add'
    element :title, 'input[name=title]'
    element :status, 'input[placeholder=Status]'
    element :value_status, '.el-scrollbar__view '
    element :year, 'input[name=year]'
    element :release_date, 'input[name=release_date]'
    element :overview, 'textarea[name=overview]'
    element :cast, 
   


    def click_icon_add()
        add.click
    end

    #adiciona valores indepentes em um textarea
    def add_cast(cast)
        actor = find('.input-new-tag')
        
        cast.each do |a|
            actor.set a 
            actor.send_keys :tab
            
        end 
    end 

    # faz upload de um arquivo que estána raiz do projeto
    def upload_file(file)
        cover_file =   File.join(Dir.pwd, "spec/fixtures/cover/" + file)
        ## no windos tem que converter o formato das barras mais para isso instala a gem "os"
        cover_file = cover_file.tr("/","\\") if OS.windows?
        #ignora os elementos ocultos
        Capybara.ignore_hidden_elements = false
        attach_file("upcover", cover_file)
        #retorna os elemento ocultos  
        Capybara.ignore_hidden_elements = true 
    end    
   
    #Cria um filme
    def create_film(titulo, ano, data_lancamento,atores, resumo, arquivo)
        title.set titulo

        status.click
        find('.el-select-dropdown__item', text: "Disponível").click
                
        year.set ano

        release_date.set data_lancamento
        release_date.send_keys :tab

        add_cast(atores)
        overview.set resumo

        upload_file(arquivo)

        add_film

    end
    

    def add_film
       find('#create-movie').click
    end
    
    def alert
     find('.alert').text
    end

end