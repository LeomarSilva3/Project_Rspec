class LoginPage < SitePrism::Page
    include Capybara::DSL
    include RSpec::Matchers
    include RSpec::Expectations


    element :email, '#emailId'
    element :senha, '#passId'

    def insere_os_dados(email_usuario, senha_usuario)
        email.set email_usuario
        senha.set senha_usuario
    end

    def insere_usuario_senha_em_brancos(email_branco, senha_branco)
        email.set email_branco
        senha.set senha_branco
    end 
    
    def insere_senha_em_branco(email_usuario, senha_branco)
        email.set email_usuario
        senha.set senha_branco
    end  

    def insere_email_invalido(email_invalido, senha_usuario)
        email.set email_invalido
        senha.set senha_usuario 
    end
    
    def alert()
        find('.alert span').text
    end
    
    def show_authentication_user()
        sleep 0.1
        js_script = 'return window.localStorage.getItem("default_auth_token");'
        token = page.execute_script(js_script)
        expect(token.length).to be 147
    end
        

    def clica_no_botao_ENTRAR()
        click_on 'Entrar'
        
    end    

end    
