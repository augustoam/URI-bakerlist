require "rails_helper"

feature "Sessions usuários" do

  let!(:instancia){create(:instancia)}
  let!(:usuario_instancia) {create(:usuario_instancia, email: 'session@email.com', instancia: instancia)}

  scenario "Deve permitir Login." do
    visit new_usuario_registration_path

    fill_in 'Email', with: 'session@email.com'
    fill_in('Password', with: '123456', match: :prefer_exact)
    fill_in('Password confirmation', with: '123456', match: :prefer_exact)
    click_on 'Inscrever-se'

    token = Usuario.last.confirmation_token
    visit usuario_confirmation_path(confirmation_token: token)
    
    visit new_usuario_session_path

    fill_in 'Email', with: 'session@email.com'
    fill_in 'Password', with: '123456'
    click_on 'Login'
    
    expect(page).to have_content("Login efetuado com sucesso.")
  end

  scenario "Não deve permitir login." do
    visit new_usuario_session_path

    fill_in 'Email', with: 'session@email.com'
    fill_in 'Password', with: 'amendoim'
    click_on 'Login'
    
    expect(page).to have_content("Email ou senha inválidos.")
  end

end