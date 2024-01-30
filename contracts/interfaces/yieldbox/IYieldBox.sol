// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.22;

/// @title TokenType
/// @author BoringCrypto (@Boring_Crypto)
/// @notice The YieldBox can hold different types of tokens:
/// Native: These are ERC1155 tokens native to YieldBox. Protocols using YieldBox should use these is possible when simple token creation is needed.
/// ERC20: ERC20 tokens (including rebasing tokens) can be added to the YieldBox.
/// ERC1155: ERC1155 tokens are also supported. This can also be used to add YieldBox Native tokens to strategies since they are ERC1155 tokens.
enum IYieldBoxTokenType {
    Native,
    ERC20,
    ERC721,
    ERC1155,
    None
}
// !! THIS FILE WAS AUTOGENERATED BY abi-to-sol v0.8.0. SEE SOURCE BELOW. !!

interface IYieldBox {
    error AmountTooLow();
    error AssetNotValid();
    error ForbiddenAction();
    error InvalidShortString();
    error InvalidTokenType();
    error NotSet();
    error NotWrapped();
    error RefundFailed();
    error StringTooLong(string str);
    error ZeroAddress();

    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);
    event ApprovalForAsset(address indexed sender, address indexed operator, uint256 assetId, bool approved);
    event AssetRegistered(
        uint8 indexed tokenType,
        address indexed contractAddress,
        address strategy,
        uint256 indexed tokenId,
        uint256 assetId
    );
    event Deposited(
        address indexed sender,
        address indexed from,
        address indexed to,
        uint256 assetId,
        uint256 amountIn,
        uint256 shareIn,
        uint256 amountOut,
        uint256 shareOut,
        bool isNFT
    );
    event EIP712DomainChanged();
    event OwnershipTransferred(uint256 indexed tokenId, address indexed previousOwner, address indexed newOwner);
    event TokenCreated(address indexed creator, string name, string symbol, uint8 decimals, uint256 tokenId);
    event TransferBatch(
        address indexed _operator, address indexed _from, address indexed _to, uint256[] _ids, uint256[] _values
    );
    event TransferSingle(
        address indexed _operator, address indexed _from, address indexed _to, uint256 _id, uint256 _value
    );
    event URI(string _value, uint256 indexed _id);
    event Withdraw(
        address indexed sender,
        address indexed from,
        address indexed to,
        uint256 assetId,
        uint256 amountIn,
        uint256 shareIn,
        uint256 amountOut,
        uint256 shareOut
    );

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function amountOf(address user, uint256 assetId) external view returns (uint256 amount);

    function assetCount() external view returns (uint256);

    function assetTotals(uint256 assetId) external view returns (uint256 totalShare, uint256 totalAmount);

    function assets(uint256)
        external
        view
        returns (IYieldBoxTokenType tokenType, address contractAddress, address strategy, uint256 tokenId);

    function balanceOf(address, uint256) external view returns (uint256);

    function balanceOfBatch(address[] memory owners, uint256[] memory ids)
        external
        view
        returns (uint256[] memory balances);

    function batch(bytes[] memory calls, bool revertOnFail) external payable;

    function batchBurn(uint256 tokenId, address[] memory froms, uint256[] memory amounts) external;

    function batchMint(uint256 tokenId, address[] memory tos, uint256[] memory amounts) external;

    function batchTransfer(address from, address to, uint256[] memory assetIds_, uint256[] memory shares_) external;

    function burn(uint256 tokenId, address from, uint256 amount) external;

    function claimOwnership(uint256 tokenId) external;

    function createToken(string memory name, string memory symbol, uint8 decimals, string memory uri)
        external
        returns (uint32 tokenId);

    function decimals(uint256 assetId) external view returns (uint8);

    function deposit(
        IYieldBoxTokenType tokenType,
        address contractAddress,
        address strategy,
        uint256 tokenId,
        address from,
        address to,
        uint256 amount,
        uint256 share
    ) external returns (uint256 amountOut, uint256 shareOut);

    function depositAsset(uint256 assetId, address from, address to, uint256 amount, uint256 share)
        external
        returns (uint256 amountOut, uint256 shareOut);

    function depositETH(address strategy, address to, uint256 amount)
        external
        payable
        returns (uint256 amountOut, uint256 shareOut);

    function depositETHAsset(uint256 assetId, address to, uint256 amount)
        external
        payable
        returns (uint256 amountOut, uint256 shareOut);

    function depositNFTAsset(uint256 assetId, address from, address to)
        external
        returns (uint256 amountOut, uint256 shareOut);

    function eip712Domain()
        external
        view
        returns (
            bytes1 fields,
            string memory name,
            string memory version,
            uint256 chainId,
            address verifyingContract,
            bytes32 salt,
            uint256[] memory extensions
        );

    function ids(IYieldBoxTokenType tokenType, address contractAddr, address strategy, uint256 assetId)
        external
        view
        returns (uint256);

    function isApprovedForAll(address, address) external view returns (bool);

    function isApprovedForAsset(address, address, uint256) external view returns (bool);

    function mint(uint256 tokenId, address to, uint256 amount) external;

    function name(uint256 assetId) external view returns (string memory);

    function nativeTokens(uint256)
        external
        view
        returns (string memory name, string memory symbol, uint8 decimals, string memory uri);

    function nonces(address owner) external view returns (uint256);

    function onERC1155BatchReceived(address, address, uint256[] memory, uint256[] memory, bytes memory)
        external
        pure
        returns (bytes4);

    function onERC1155Received(address, address, uint256, uint256, bytes memory) external pure returns (bytes4);

    function onERC721Received(address, address, uint256, bytes memory) external pure returns (bytes4);

    function owner(uint256) external view returns (address);

    function pendingOwner(uint256) external view returns (address);

    function permit(address owner, address spender, uint256 assetId, uint256 deadline, uint8 v, bytes32 r, bytes32 s)
        external;

    function permitAll(address owner, address spender, uint256 deadline, uint8 v, bytes32 r, bytes32 s) external;

    function permitToken(
        address token,
        address from,
        address to,
        uint256 amount,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function registerAsset(IYieldBoxTokenType tokenType, address contractAddress, address strategy, uint256 tokenId)
        external
        returns (uint256 assetId);

    function revoke(address owner, address spender, uint256 assetId, uint256 deadline, uint8 v, bytes32 r, bytes32 s)
        external;

    function revokeAll(address owner, address spender, uint256 deadline, uint8 v, bytes32 r, bytes32 s) external;

    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data
    ) external;

    function safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes memory data) external;

    function setApprovalForAll(address operator, bool approved) external;

    function setApprovalForAsset(address operator, uint256 assetId, bool approved) external;

    function supportsInterface(bytes4 interfaceID) external pure returns (bool);

    function symbol(uint256 assetId) external view returns (string memory);

    function toAmount(uint256 assetId, uint256 share, bool roundUp) external view returns (uint256 amount);

    function toShare(uint256 assetId, uint256 amount, bool roundUp) external view returns (uint256 share);

    function totalSupply(uint256) external view returns (uint256);

    function transfer(address from, address to, uint256 assetId, uint256 share) external;

    function transferMultiple(address from, address[] memory tos, uint256 assetId, uint256[] memory shares) external;

    function transferOwnership(uint256 tokenId, address newOwner, bool direct, bool renounce) external;

    function uri(uint256 assetId) external view returns (string memory);

    function uriBuilder() external view returns (address);

    function withdraw(uint256 assetId, address from, address to, uint256 amount, uint256 share)
        external
        returns (uint256 amountOut, uint256 shareOut);

    function wrappedNative() external view returns (address);
}
