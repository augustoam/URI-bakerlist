require "rails_helper"

feature "confirmations usuarios" do

  let!(:instancia){create(:instancia)}
  let!(:usuario_instancia) {create(:usuario_instancia, email: 'confirmation@email.com', instancia: instancia)}
 
  scenario "Deve permitir registro e confirmação da conta." do
    visit new_usuario_registration_path

    fill_in 'Email', with: 'confirmation@email.com'
    fill_in('Password', with: 'amendoim', match: :prefer_exact)
    fill_in('Password confirmation', with: 'amendoim', match: :prefer_exact)
    click_on 'Inscrever-se'

    token = Usuario.last.confirmation_token
    Token.create!(token: '123', usuario: Usuario.last)
    visit usuario_confirmation_path(confirmation_token: token)
 
    expect(page).to have_content("A sua conta foi confirmada com sucesso.")
  end

  scenario "Deve permitir registro e nao deve permitir confirmação da conta." do
    visit new_usuario_registration_path

    fill_in 'Email', with: 'confirmation@email.com'
    fill_in('Password', with: 'amendoim', match: :prefer_exact)
    fill_in('Password confirmation', with: 'amendoim', match: :prefer_exact)
    click_on 'Inscrever-se'

    token = Usuario.last.confirmation_token
    Usuario.last.destroy
    visit usuario_confirmation_path(confirmation_token: token)
 
    expect(page).to have_content("Token inválido. Reenvie as instruções para seu email.")
  end

  scenario "Deve permitir reenvio das instruções para email." do
    visit new_usuario_registration_path

    fill_in 'Email', with: 'confirmation@email.com'
    fill_in('Password', with: 'amendoim', match: :prefer_exact)
    fill_in('Password confirmation', with: 'amendoim', match: :prefer_exact)
    click_on 'Inscrever-se'

    visit new_usuario_confirmation_path
    
    fill_in 'Email', with: 'confirmation@email.com'
    click_on 'Reenviar instruções'
    
    expect(page).to have_content("Dentro de minutos, você receberá um email com as instruções de confirmação da sua conta.")
  end

  scenario "Não Deve permitir reenvio das instruções para email." do  
    visit new_usuario_confirmation_path
 
    fill_in 'Email', with: 'naoexisteconfirmation@email.com'
    click_on 'Reenviar instruções'

    expect(page).to have_content("não encontrado")
  end

end