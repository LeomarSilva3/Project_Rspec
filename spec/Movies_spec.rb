require_relative "../pages/movie_page.rb"


describe 'Cadastrar Filmes', :filmes do
    
    before(:each) do
        visit '/'
        @movie_page = MoviePage.new
        @login_page = LoginPage.new
        @sidebar_page = SidebarPage.new
        @login_page.insere_os_dados("tony@stark.com", "pwd123")
        @login_page.clica_no_botao_ENTRAR()
    end



    #Base de dados para teste
     ultimato = Hash.new
     ultimato = [
                title => "Vingadores Ultimato",
                status => "Disponível",
                year => 2019,
                release_date => "24/04/2019",
                cast => ["Robert Downey Jr", "Chris Evans", "Brian Larson", "Scarlett Johansson"],
                overview => "Apos THanos eliminar metade do universo, os vingadores terao que resolver esta treta.",
                cover => "ultimato.jpg"
     ]
  

    it 'cadastro de filmes' do
        
        #puts ultimato
        # # find('.nc-simple-add').click
        # # sleep 2

        ultimato.each do |i|
            @movie_page.cadastrar_filmes(ultimato)
        end
        

    end   

end

