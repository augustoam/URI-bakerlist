require "rails_helper"

feature "registrations usuarios" do

  let!(:instancia){create(:instancia)}
  let!(:usuario_instancia) {create(:usuario_instancia, email: 'registration@email.com', instancia: instancia)}
  
  scenario "Deve permitir registro" do
    visit new_usuario_registration_path

    fill_in 'Email', with: 'registration@email.com'
    fill_in('Password', with: 'amendoim', match: :prefer_exact)
    fill_in('Password confirmation', with: 'amendoim', match: :prefer_exact)
    click_on 'Inscrever-se'

    expect(page).to have_content("Uma mensagem com um link de confirmação foi enviada para o seu e-mail. Por favor, acesse o link para ativar sua conta.")
  end

  scenario "Não deve permitir registro para usuário que não existe em UsuarioInstancia" do
    visit new_usuario_registration_path

    fill_in 'Email', with: 'naoexisteregistration@email.com'
    fill_in('Password', with: '123456', match: :prefer_exact)
    fill_in('Password confirmation', with: '123456', match: :prefer_exact)
    click_on 'Inscrever-se'

    expect(page).to have_content("Este email não é válido para cadastro. Verifique antes de continuar.")
  end

  scenario "Não deve permitir registro pois senha é muito curta" do
    visit new_usuario_registration_path

    fill_in 'Email', with: 'registration@email.com'
    fill_in('Password', with: '12', match: :prefer_exact)
    fill_in('Password confirmation', with: '12', match: :prefer_exact)
    click_on 'Inscrever-se'
    
    expect(page).to have_content("Muito curto")
  end

  scenario "Não deve permitir registro pois senhas não são iguais" do
    visit new_usuario_registration_path

    fill_in 'Email', with: 'registration@email.com'
    fill_in('Password', with: '123456', match: :prefer_exact)
    fill_in('Password confirmation', with: '654321', match: :prefer_exact)
    click_on 'Inscrever-se'
    
    expect(page).to have_content("A senhas não são iguais")
  end

end