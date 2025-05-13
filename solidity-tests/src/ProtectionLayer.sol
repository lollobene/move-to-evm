// SPDX-License-Identifier: MIT

pragma solidity >=0.8.19;

import {IProtectionLayerProtectorV1} from "./interfaces/IProtectionLayerProtectorV1.sol";
import {IProtectedContractV1} from "./interfaces/IProtectedContractV1.sol";

contract ProtectionLayer is IProtectionLayerProtectorV1 {
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
    mapping(address => mapping(uint256 => Type)) H;
    uint256 sizeOfH;

    // - Transient
    mapping(address => mapping(uint256 => bytes)) T;
    uint256 sizeOfT;

    // - E ⊆ (A × N256)
    mapping(address => uint256) E;

    // - f ∈ {true, false}
    bool flag;
    IProtectedContractV1 protected_contract;

    function validate() internal view returns (bool) {
        assert(flag == false); // , "Protection layer is still active");
        assert(sizeOfH == 0); // , "Resource or reference still around");
        assert(address(protected_contract) == address(0)); // , "Signer still up");
        return true;
    }

    function protect(
        IProtectedContractV1 _protected_contract,
        address requester
    ) external returns (bool) {
        assert(flag == false); // , "Protection layer is already active");
        flag = true;
        protected_contract = _protected_contract;
        bool success = protected_contract.onProtect(requester);
        assert(success); // , "Callback error");
        return true;
    }

    function release() external returns (bool) {
        assert(flag == true); // , "Protection layer not active");
        flag = false;
        delete protected_contract;
        assert(validate()); // , "Constraints have been violated");
        return true;
    }

    function isProtected() public view returns (bool) {
        return flag;
    }

    /*
    modifier resOut(uint256 resId) {
        assert(flag == true); // , "protection layer not active");
        H[address(protected_contract)][resId] = T(0);
        sizeOfH++;
        _;
    }


    modifier storeExt(uint256 resId) {
        assert(flag == true); // , "protection layer not active");
        delete H[address(protected_contract)][resId];
        E[address(protected_contract)] = resId;
        sizeOfH--;
        _;
    }

    modifier unstoreExt(uint256 resId) {
        assert(flag == true); // , "protection layer not active");
        delete E[address(protected_contract)];
        H[address(protected_contract)][resId] = T(0);
        sizeOfH++;
        _;
    }

    function forwardRes(
        address to,
        uint256 id,
        address callee,
        bytes calldata cb
    ) external {}
    */
}
