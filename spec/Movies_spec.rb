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
        atores = ["Robert Downey Jr", "Chris Evans", "Brian Larson", "Scarlett Johansson"]
        resumo = 'Apos THanos eliminar metade do universo, os vingadores terao que resolver esta treta.'
        arquivo = 'ultimato.jpg'

    #valores obrigatorios
        titulo_branco = ""#mensagem ''
        valorstatus_branco = "" #mensagem ''
        ano_branco = #mensagem ''
        data_lancamento_branco = #mensagem ''

    #mensagem
        message_titulo_obrigatorio = 'Oops - Filme sem titulo. Pode isso Arnaldo?'    
        message_status_obrigatorio = 'Oops - O status deve ser informado!'
        message_ano_obrigatorio = 'Oops - Faltou o ano de lançamento também!'
        message_datalancamento_obrigatorio = 'Oops - Quase lá, só falta a data de estréia!'

    it 'cadastro de filmes' do

        @movie_page.click_icon_add()        
        @movie_page.create_film(titulo, ano, data_lancamento, atores, resumo, arquivo)            

    end 
    
    it 'titulo obrigatóro' do
        @movie_page.click_icon_add
        @movie_page.create_film(titulo_branco, ano, data_lancamento, atores, resumo, arquivo)            
        expect(@movie_page.alert).to eql message_titulo_obrigatorio
    
    end

    it 'ano obrigatorio' do
        @movie_page.click_icon_add
        @movie_page.create_film(titulo, data_lancamento, atores, resumo, arquivo)            
        expect(@movie_page.alert).to eql message_ano_obrigatorio
    
    end

    it 'data_lancamento obrigatorio' do
        @movie_page.click_icon_add
        @movie_page.create_film(titulo,ano, atores, resumo, arquivo)            
        expect(@movie_page.alert).to eql message_datalancamento_obrigatorio
    
    end
end

