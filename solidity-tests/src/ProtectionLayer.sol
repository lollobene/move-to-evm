// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.19;

contract ProtectionLayer {

    // The state of the protection layer P is described by a tuple (H , E , f )
    // where: 
    
    // - H ⊆ (A × N256 × T ) is the set of hot values
    //      A the set of all valid addresses
    //      N256 the set of all 256-bit sized integers
    //      T := {ref , res}
    enum T {
        ref,
        res
    }
    mapping(address=>mapping(uint256=>T)) H;
    uint256 sizeOfH;
    
    // - E ⊆ (A × N256)
    mapping(address=>uint256) E;

    // - f ∈ {true, false}
    bool f;
    address signer;

    function validate() internal view returns (bool) {
        require(f == false, "Protection layer is still active");
        require(sizeOfH == 0, "Resource or reference still around");
        require(signer == address(0), "Signer still up");
        return true;
    }

    function protect(address _signer, bytes calldata cb) external {
        require(f == false, "Protection layer is already active");
        f = true;
        signer = _signer;
        (bool success, ) = (msg.sender).call(cb);
        require(success, "Callback error");
        f = false;
        delete signer;
        require(validate(), "Constraints have been violated");
    }

    modifier resOut(uint256 resId) {
        require(f == true, "protection layer not active");
        H[signer][resId] = T(0);
        sizeOfH++;
        _;
    }

    modifier resIn(uint256 resId) {
        require(f == true, "protection layer not active");
        delete H[signer][resId];
        sizeOfH--;
        _;
    }

    modifier storeExt(uint256 resId) {
        require(f == true, "protection layer not active");
        delete H[signer][resId];
        E[signer] = resId;
        sizeOfH--;
        _;
    }

    modifier unstoreExt(uint256 resId) {
        require(f == true, "protection layer not active");
        delete E[signer];
        H[signer][resId] = T(0);
        sizeOfH++;
        _;
    }


    function forwardRes(address to, uint256 id, address callee, bytes calldata cb) external {}
}