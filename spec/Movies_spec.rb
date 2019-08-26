require_relative "../pages/movie_page.rb"


describe 'Cadastrar Filmes', :filmes do
    
    before(:each) do
        visit '/'
        @movie_page = MoviePage.new
        @login_page = LoginPage.new
        @login_page.insere_os_dados("tony@stark.com", "pwd123")
        @login_page.clica_no_botao_ENTRAR()
    end



    #Base de dados para teste
   
        titulo = 'Vingadores Ultimato'
        valorstatus = 'Disponível'
        ano = 2019
        data_lancamento = '24/04/2019'
        cast = ["Robert Downey Jr", "Chris Evans", "Brian Larson", "Scarlett Johansson"]
        overview = 'Apos THanos eliminar metade do universo, os vingadores terao que resolver esta treta.'
        cover = 'ultimato.jpg'


    it 'cadastro de filmes' do

        @movie_page.adicionar()        
        @movie_page.cadastrar_filmes(titulo, ano, data_lancamento, cast)            

    end   

end

