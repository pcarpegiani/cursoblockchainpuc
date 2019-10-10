pragma solidity 0.5.12;

contract Aluguel 
{


    /*
    como fazer comentário grande sem que o compilador traga para o arquivo, basta colocar o /* para abrir o comentário e o de baixo para fechar
    */

    // vale apenas para uma linha de comentário 

    string public locador;
    string public locatario;
    uint valor;

    uint constant public numeroMaximoLegaldeAlugueisParaMulta = 3;
    //a escrita é sempre junta pois espaço é entendido como outra iformação podendo ser maiúscilo no meio


    constructor(string memory nomeLocador, string memory nomeLocatario, uint valorDoAluguel) public 
    {
    locador = nomeLocador;
    locatario = nomeLocatario;
    valor = valorDoAluguel;
    }
    // parametros são as variaveis que voce colocou dentro da função e utiliza o simbolo = para atribuir o dado
    // as chaves{} contém o contrato e as funções sempre
    // as funções são escritas entre parenteses () sendo que mesmo vazias são obrigatórias

    function valorAtualDoAluguel() public view returns (uint)
    {
        return valor;
    }
    
    //a função acima permite tornar pública a função inicialmente privada    

    function simulamulta( uint mesesRestantes, uint totalMesesContrato)    public view returns (uint valorMulta)
    {
    
    valorMulta = valor*numeroMaximoLegaldeAlugueisParaMulta;
    valorMulta = valorMulta/totalMesesContrato;
    valorMulta = valorMulta/mesesRestantes;
    return valorMulta;
    }
    
    function reajustaAluguel(uint percentualReajuste) public
    {
        if (percentualReajuste >20)
        {
            percentualReajuste = 20;
        }
        uint valorDoAcrescimo = 0;
        valorDoAcrescimo = ((valor*percentualReajuste)/100);
        valor = valor + valorDoAcrescimo;
    }
    
    function aditamentoValorAluguel (uint valorCerto) public
    {
        valor = valorCerto;
    }
    // i++ é a mesma coisa que i=i+1 (um atalho)
    
    function aplicaMulta( uint mesesRestantes, uint percentual) public
    {
        require (mesesRestantes<30, "Período de contrato Inválido");
        for (uint i=1; i <mesesRestantes; i++){
            valor = valor+((valor*percentual)/100);
            }
   // i é um indice que nesse caso são meses
    }
}
