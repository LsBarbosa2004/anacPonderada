// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Idade {
    uint public idade;
    // Variável para armazenar o endereço do dono do contrato
    address public donoContrato;
    // Modificador para restringir o acesso a determinadas funções apenas ao dono do contrato
    modifier apenasDono() {
        require(msg.sender == donoContrato, "Apenas o dono do contrato pode realizar esta operacao");
        _;
    }
    // Construtor do contrato que define o dono como o endereço que implantou o contrato
    constructor() {
        idade = 18;
        donoContrato = msg.sender;
    }
    // Função para definir a idade (acessível apenas pelo dono do contrato)
    function setIdade(uint novaIdade) public apenasDono {
        idade = novaIdade;
    }
    // Função para obter a idade (função de consulta)
    function getIdade() public view returns (uint) {
        return idade;
    }
}
