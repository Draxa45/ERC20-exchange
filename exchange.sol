pragma solidity ^0.8.0;


interface IERC20 {
 
    event Transfer(address indexed from, address indexed to, uint256 value);


    event Approval(address indexed owner, address indexed spender, uint256 value);


    function totalSupply() external view returns (uint256);

 
    function balanceOf(address account) external view returns (uint256);


    function transfer(address to, uint256 amount) external returns (bool);

 
    function allowance(address owner, address spender) external view returns (uint256);


    function approve(address spender, uint256 amount) external returns (bool);


    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

    contract ERC20Exchange {
        address tokenX;
        address tokenY;
        
        constructor(address x, address y){

            tokenX = x;
            tokenY = y;
        }

        function exchangeXtoY(address from,address to, uint amount) external{

            uint x = IERC20(tokenX).balanceOf(address(this)); //total x coins on contract
            uint y = IERC20(tokenY).balanceOf(address(this)); // total y coins on contract
            
            uint dy =  (y * amount)/(x + amount); //calculate how much coin y to send

            IERC20(from).transferFrom(msg.sender,address(this),amount);
            IERC20(to).transfer(msg.sender,dy);
        }
           function exchangeYtoX(address from,address to, uint amount) external{

            uint x = IERC20(tokenX).balanceOf(address(this)); //total x coins on contract
            uint y = IERC20(tokenY).balanceOf(address(this)); // total y coins on contract
            
            uint dx =  (x * amount)/(y + amount); //calculate how much coin x to send

            IERC20(from).transferFrom(msg.sender,address(this),amount);
            IERC20(to).transfer(msg.sender,dx);
        }
    }

   