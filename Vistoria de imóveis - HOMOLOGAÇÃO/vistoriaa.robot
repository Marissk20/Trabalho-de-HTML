*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          http://sig.teste.leiloesjudiciaisbrasil.com.br/index/leiloes
${LOGIN_EMAIL}    name=email
${EMAIL}    mariana.paula@leiloesjudiciais.com.br
${LOGIN_SENHA}    name=senha
${SENHA}    PSilva
${LOGAR}    name=submit
${LINK_FORMULARIO}    http://sig.teste.leiloesjudiciaisbrasil.com.br/vistoria/imoveis-formulario
${SELECT_ COMITENTE}    id=comitente_id_chzn
${OPÇÃO_COMITENTE}    id=comitente_id_chzn_o_1
${GERAR_NUMERO_AUTOMATICO}    class=buttonS.bBlue
${ABRIR_CAMPO_DESCRIÇÃO}    css=[title='Show Source']
${DESCRIÇÃO}    name=nm_descricao
${TEXTO}    teste teste teste teste
${SELECT_CATEGORIA}    id=parent_id_chzn
${OPÇÃO_CATEGORIA}    id=parent_id_chzn_o_25
${BOTÃO_ESTADO}    id=nm_estado
${BOTÃO_CIDADE}    id=nm_cidade
${BOTÃO_SALVAR}    class=buttonS.bGreen
${BOTÃO_NOVO}    class=buttonS.floatR.bBlue

*** Test Cases ***
Abrindo o navegador
    Open Browser    ${URL}    Chrome
    Input Text    ${LOGIN_EMAIL}    ${EMAIL}
    Input Password    ${LOGIN_SENHA}    ${SENHA}
    Click Button    ${LOGAR}
    Go To    ${LINK_FORMULARIO}

Cadastrar vistoria do imóvel
    FOR    ${i}    IN RANGE    15
    Click Element    ${SELECT_ COMITENTE}
    Click Element    ${OPÇÃO_COMITENTE}
    Click Element    ${GERAR_NUMERO_AUTOMATICO}
    Click Element    ${ABRIR_CAMPO_DESCRIÇÃO}
    Click Element    ${DESCRIÇÃO}
    Input Text    ${DESCRIÇÃO}    ${TEXTO}
    Click Element    ${SELECT_CATEGORIA}
    Click Element    ${SELECT_CATEGORIA}
    Click Element    ${OPÇÃO_CATEGORIA}
    Select From List by Label    ${BOTÃO_ESTADO}    DF
    Sleep    5s
    Select From List by Label    ${BOTÃO_CIDADE}    Brasília
    Click Element    ${BOTÃO_SALVAR}
    Click Element    ${BOTÃO_NOVO}
    END

Finalizar teste
    Close Browser
