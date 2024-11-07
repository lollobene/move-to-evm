// SPDX-License-Identifier: MIT

pragma solidity >=0.8.19;

import {IProtectionLayerProtectorV3} from "./interfaces/IProtectionLayerProtectorV3.sol";
import {IProtectedContractV2} from "./interfaces/IProtectedContractV2.sol";

contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {
    // ***** Protection Layer State *****

    // The state of the protection layer P is described by a tuple (H , E , f )
    // where:

    // - H ⊆ (A × N256 × T ) is the set of hot values
    //      A the set of all valid addresses
    //      N256 the set of all 256-bit sized integers
    //      T := {ref , res}
    enum Type {
        ref,
        res
    }
    uint256 id;

    mapping(address => mapping(uint256 => Type)) H;
    uint256 sizeOfH;

    // - Transient
    mapping(address => mapping(uint256 => DroppedRes)) T;
    uint256 sizeOfT;

    // - E ⊆ (A × N256)
    mapping(address => uint256) E;

    // - f ∈ {true, false}
    bool flag;
    // This is not permanetly stored in the contract,
    // it will be used only at runtime an deleted after
    address protected_contract;
    address signer;

    // ***** Contract State *****

    struct DroppedRes {
        uint256 a;
        uint256 b;
        bool flag;
    }

    mapping(address => DroppedRes) state;

    // ***** Contract Functions *****

    constructor() {
        DroppedRes memory res = DroppedRes(14, 44, true);
        state[msg.sender] = res;
    }

    function allocate(uint256 a, uint256 b) public {
        DroppedRes memory res = DroppedRes(a, b, true);
        require(state[msg.sender].flag == false, "Resource already allocated");
        state[msg.sender] = res;
    }

    function set(uint256 a, address owner) public {
        require(state[owner].flag == true, "Resource not found");
        state[owner].a = a;
    }

    function read(address owner) public view returns (uint256) {
        require(state[owner].flag == true, "Resource not found");
        return state[owner].a;
    }

    function remove(address owner) public {
        require(state[owner].flag == true, "Resource not found");
        delete state[owner];
    }

    // * Here we would like to get 'DroppedRes' as a parameter, but we can't
    // * because then we should not be able to identify it.
    function sink(uint256 resId) external {
        DroppedRes memory res = resIn(resId);
        unpack(res);
    }

    function dropRes() external returns (uint256) {
        DroppedRes memory res = DroppedRes(14, 44, false);
        return resOut(res);
    }

    function dropResFromStorage(address owner) external returns (uint256) {
        require(state[owner].flag == true, "Resource not found");
        DroppedRes memory res = state[owner];
        delete state[owner];
        return resOut(res);
    }

    function storeExternalResource(uint256 resRef) external {
        storeExternal(resRef);
    }

    function unstoreExternalResource(uint256 resRef) external {
        unstoreExternal(resRef);
    }

    // ***** Protection Layer Functions *****

    function validate() internal view returns (bool) {
        assert(flag == false); // , "Protection layer is still active");
        assert(sizeOfH == sizeOfT && sizeOfH == 0); // , "Resource or reference still around");
        assert(address(protected_contract) == address(0)); // , "Signer still up");
        assert(signer == address(0)); // , "Requester still up");
        return true;
    }

    function protect(
        address _protected_contract,
        bytes memory callback
    ) external returns (bool) {
        assert(flag == false); // , "Protection layer is already active");
        assert(_protected_contract != address(0)); // , "Invalid protected_contract address");
        flag = true;
        protected_contract = _protected_contract;
        signer = msg.sender;
        (bool success, ) = protected_contract.call(callback);
        assert(success); // , "Callback error");
        flag = false;
        delete protected_contract;
        delete signer;
        assert(validate()); // , "Constraints have been violated");
        return true;
    }

    function isProtected() public view returns (bool) {
        return flag;
    }

    function resIn(uint256 resId) private returns (DroppedRes memory res) {
        assert(flag == true); // , "protection layer not active");
        assert(H[signer][resId] == Type.res); // , "Resource not found");
        res = T[signer][resId];
        delete H[signer][resId];
        sizeOfH--;
        delete T[signer][resId];
        sizeOfT--;
    }

    function resOut(DroppedRes memory res) private returns (uint256) {
        assert(flag == true); // , "protection layer not active");
        id++;
        sizeOfH++;
        H[signer][id] = Type.res;
        sizeOfT++;
        T[signer][id] = res;
        return id;
    }

    function storeExternal(uint256 resId) private {
        assert(flag == true); // , "protection layer not active");
        assert(H[signer][resId] == Type.res); // , "Resource not found");
        DroppedRes memory res = T[signer][resId];
        require(res.a == 14, "Invalid resource");
        require(res.flag == false, "Resource already stored");
        res.flag = true;
        delete H[signer][resId];
        sizeOfH--;
        delete T[signer][resId];
        sizeOfT--;
        E[signer] = resId;
        state[signer] = res;
    }

    function unstoreExternal(uint256 resId) private {
        assert(flag == true); // , "protection layer not active");
        assert(E[signer] == resId); // , "Resource not found");
        assert(state[signer].flag == true); // , "Resource not stored");
        DroppedRes memory res = state[signer];
        require(res.a == 14, "Invalid resource");
        require(res.flag == true, "Resource not stored");
        res.flag = false;
        delete E[signer];
        delete state[signer];
        assert(state[signer].flag == false); // , "Resource not removed");
        assert(state[signer].a == 0); //, "Resource is not 0");

        sizeOfH++;
        H[signer][resId] = Type.res;
        sizeOfT++;
        T[signer][resId] = res;
    }

    function unpack(DroppedRes memory res) private view {}
}
