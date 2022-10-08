pragma solidity 0.8.7;

contract Wallet {

    struct wallet {
        uint balance;
        uint nbPayements;
    }

    mapping (address => wallet) Wallets;

    function getTotalBalance() public view returns(uint){
        return address(this).balance; 
    }

    function getBalance(address _address) public view returns(uint){
        return Wallets[_address].balance;
    }

    function withdrawAllMoney(address payable _to) public {
        uint _amount = Wallets[msg.sender].balance;
        Wallets[msg.sender].balance = 0;
        _to.transfer(_amount);
    }
    
    receive() external payable {
        Wallets[msg.sender].balance = msg.value;
        Wallets[msg.sender].nbPayements += 1;
    }
}