
require_relative "../pages/login_page.rb"

describe 'Realizar Login', :login do
           
        before(:each) do
          visit '/?pg=login'
          @user = LoginPage.new
        end    
        
        email_usuario = 'tony@stark.com'
        senha_usuario = 'pwd123'
        email_invalido = 'leomr@@@@@gmail.com'
        senha_invalida = '1234567890'
        senha_branco = ''
        email_branco = ''
        

        it 'com sucesso' do
            @user.insere_os_dados(email_usuario, senha_usuario)
            @user.clica_no_botao_ENTRAR()
            @user.show_authentication_user()
        end
        
        it 'com campos em branco' do
            begin
                @user.insere_usuario_senha_em_brancos(email_branco, senha_branco)
                @user.clica_no_botao_ENTRAR()
                message = find('.alert span');
                expect(message.text).to eql 'Opps. Cadê o email?'
            rescue Error => e
                puts e.message
            end    
        end 

        it 'com senha em branco' do
            begin
                @user.insere_usuario_senha_em_brancos(email_usuario, senha_branco)
                @user.clica_no_botao_ENTRAR()
                message = find('.alert span');
                expect(message.text).to eql 'Opps. Cadê a senha?'
            rescue Error => e
                puts e.message
            end    
        end

        
        it 'com email invalido' do

            begin
                @user.insere_email_invalido(email_invalido, senha_usuario)
                @user.clica_no_botao_ENTRAR()
                message = find('.alert span');
                expect(message.text).to eql 'Usuário e/ou senha inválidos'
            rescue Error => e
                puts e.message
            end     
                
        end    
        
        
        
end
