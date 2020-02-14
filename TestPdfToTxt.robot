O usuario confere os dados do Boleto
    ${home_dir}=        normalize path  ~
    ${download_dir}     Join Path   ${home_dir}     Downloads
    @{items} =	OperatingSystem.List Directory                 ${download_dir}       Boleto_*.pdf
    ${date} =	        Get Current Date    result_format=%Y%m%d
    ${file}=            Join Path    ${download_dir}    ${items[0]}

    ${PDF_EXTRACT_TEXT}     Process.Run Process         pdf2txt.py  ${file}    shell=yes  alias=myproc
    ${stdout}	${stderr} =	Get Process Result	myproc	stdout=yes	stderr=yes
    Log            ${stdout}
    ${Beneficiario}                 Should Contain  ${stdout}  MD PE MRV VENEZA CONSTRUCOES
    ${Agencia/Código Beneficiario}  Should Contain  ${stdout}  1911-9/1064-2
    ${Nosso Numero}                 Should Contain  ${stdout}  674329886639-1
    ${Linha Digitavel}              Should Contain  ${stdout}  00190.00009 \ 00000.067439 \ 29886.639177 \ 1 \ 82730000001500
