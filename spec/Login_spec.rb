
require_relative "../pages/login_page.rb"
require_relative "../pages/views/sidebar_page.rb"

describe 'Realizar Login', :login do
           
        before(:each) do
          visit '/'
          @login_page = LoginPage.new
          @sidebar_page = SidebarPage.new
        end    
        
        # Base de dados para teste
            email_usuario = 'tony@stark.com'
            senha_usuario = 'pwd123'
            email_invalido = 'leomr@@@@@gmail.com'
            senha_invalida = '1234567890'
            msg_email = 'Opps. Cadê o email?'
            msg_senha = 'Opps. Cadê a senha?'
            dados_invalidos = 'Usuário e/ou senha inválidos'
            senha_branco = ''
            email_branco = ''
            usuario = 'Tony Stark'

        it 'com sucesso' do
            @login_page.insere_os_dados(email_usuario, senha_usuario)
            @login_page.clica_no_botao_ENTRAR()
            @login_page.show_authentication_user()
            expect(@sidebar_page.user_authenticated).to eql usuario
        end
        
        it 'com campos em branco' do
            begin
                @login_page.insere_usuario_senha_em_brancos(email_branco, senha_branco)
                @login_page.clica_no_botao_ENTRAR()
                expect(@login_page.alert).to eql msg_email
            rescue Error => e
                puts e.message
            end    
        end 

        it 'com senha em branco' do
            begin
                @login_page.insere_usuario_senha_em_brancos(email_usuario, senha_branco)
                @login_page.clica_no_botao_ENTRAR()
                expect(@login_page.alert).to eql msg_senha
            rescue Error => e
                puts e.message
            end    
        end

        
        it 'com email invalido' do

            begin
                @login_page.insere_email_invalido(email_invalido, senha_usuario)
                @login_page.clica_no_botao_ENTRAR()
                expect(@login_page.alert).to eql dados_invalidos
            rescue Error => e
                puts e.message
            end     
                
        end    
        
        
        
end
