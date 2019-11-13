*** Settings ***
Documentation            SSH Library Demo
Library                  SSHLibrary
Suite Setup              Open Connection And Log In
Suite Teardown           Close All Connections

*** Variables ***
${DIR}                   /home/usuario/executables/

*** Keywords ***
Open SSH Connection And Log In
    Open Connection       ${SSH_HOST}
    Login                 ${SSH_USERNAME}          ${SSH_PASSWORD}

Close SSH Connection
    Close Connection

FILE_IMPORT: é importado o arquivo de remessa do cedente: ${dados_cedente} ${BANCO}
    [Timeout]                           59 seconds
    Write                               ${DIR}ExecuteCommand.run
    ${rup_rem1}=                        Read Until Prompt
    ${read_output}=                     Read
    Should Contain                      ${read_output}    [K
    Should Not Contain                  ${read_output}    ERROR

[Teardown]	Close all connections
